Content-Type: multipart/mixed; boundary="===============9155428357389579109=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [PATCH 6/6] fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer
Date: Thu, 28 Jun 2018 21:28:37 +0100
Message-ID: <20180628202837.GI30522@ZenIV.linux.org.uk>
In-Reply-To: <CA+55aFyPUpd3tWVqbTVXGKjMb42+g-9MCfvjXLpb0RGSOW8sbA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9155428357389579109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2018 at 12:31:14PM -0700, Linus Torvalds wrote:

> >         * a *LOT* of ->poll() instances only block in __pollwait()
> > called (indirectly) on the first pass.
> =

> They are *all* supposed to do it.

Sure, but...

static __poll_t binder_poll(struct file *filp,
                                struct poll_table_struct *wait)
{
        struct binder_proc *proc =3D filp->private_data;
        struct binder_thread *thread =3D NULL;
        bool wait_for_proc_work;

        thread =3D binder_get_thread(proc);
        if (!thread)
                return POLLERR;
...
static struct binder_thread *binder_get_thread(struct binder_proc *proc)
{
        struct binder_thread *thread;
        struct binder_thread *new_thread;

        binder_inner_proc_lock(proc);
        thread =3D binder_get_thread_ilocked(proc, NULL);
        binder_inner_proc_unlock(proc);
        if (!thread) {
                new_thread =3D kzalloc(sizeof(*thread), GFP_KERNEL);

And that's hardly unique - we have instances playing with timers,
allocations, whatnot.  Even straight mutex_lock(), as in
static __poll_t i915_perf_poll(struct file *file, poll_table *wait)
{
        struct i915_perf_stream *stream =3D file->private_data;
        struct drm_i915_private *dev_priv =3D stream->dev_priv;
        __poll_t ret;

        mutex_lock(&dev_priv->perf.lock);
        ret =3D i915_perf_poll_locked(dev_priv, stream, file, wait);
        mutex_unlock(&dev_priv->perf.lock);

        return ret;
}

or
static __poll_t cec_poll(struct file *filp,
                             struct poll_table_struct *poll)
{
        struct cec_fh *fh =3D filp->private_data;
        struct cec_adapter *adap =3D fh->adap;
        __poll_t res =3D 0;

        if (!cec_is_registered(adap))
                return EPOLLERR | EPOLLHUP;
        mutex_lock(&adap->lock);
        if (adap->is_configured &&
            adap->transmit_queue_sz < CEC_MAX_MSG_TX_QUEUE_SZ)
                res |=3D EPOLLOUT | EPOLLWRNORM;
        if (fh->queued_msgs)
                res |=3D EPOLLIN | EPOLLRDNORM;
        if (fh->total_queued_events)
                res |=3D EPOLLPRI;
        poll_wait(filp, &fh->wait, poll);
        mutex_unlock(&adap->lock);
        return res;
}

etc.

> =

> The whole idea with "->poll()" is that the model of operation is:
> =

>  -  add_wait_queue() and return state on the first pass
> =

>  - on subsequent passes (or if somebody else already returned a state
> that means we already know we're not going to wait), the poll table is
> NULL, so you *CANNOT* add_wait_queue again, so you just return state.
> =

> Additionally, once _anybody_ has returned a "I already have the
> event", we also clear the poll table queue, so subsequent accesses
> will purely be for returning the poll state.
> =

> So I don't understand why you're asking for annotation. The whole "you
> add yourself to the poll table" is *fundamentally* only done on the
> first pass. You should never do it for later passes.

Sure.  Unfortunately, adding yourself to the poll table is not the only
way to block.  And a plenty of instances in e.g. drivers/media (where
the bulk of ->poll() instances lives) are very free with grabbing mutexes
as they go.

--===============9155428357389579109==--

