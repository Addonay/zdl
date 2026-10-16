// Disposable default-executor fix for the pinned accesskit_unix context.rs.
// Close before draining: concurrent/future send failures drop owned messages.
#[cfg(not(feature = "tokio"))]
struct PendingMessages(Receiver<Message>);
#[cfg(not(feature = "tokio"))]
impl Drop for PendingMessages {
    fn drop(&mut self) {
        self.0.close();
        while self.0.try_recv().is_ok() {}
    }
}
