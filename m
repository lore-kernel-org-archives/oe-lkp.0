Content-Type: multipart/mixed; boundary="===============7451037627818736304=="
MIME-Version: 1.0
From: Sean Paul <seanpaul@chromium.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 15:06:36 -0400
Message-ID: <CAOw6vbLPBR5LE7YBwEUuUTq_esaZmwuH5mVkw93pgjQ7ng1m1g@mail.gmail.com>
In-Reply-To: <20180622110117.GU30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7451037627818736304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 7:01 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Fri, Jun 22, 2018 at 12:00:14PM +0200, Christoph Hellwig wrote:
> > And a version with select() also covered:
>
> For fuck sake, if you want vfs_poll() inlined, *make* *it* *inlined*.
> Is there any reason for not doing that other than EXPORT_SYMBOL_GPL
> fetish?  Because if there isn't, I would like to draw your attention
> to the fact that _this_ pwecious inchewlekshul pwopewty can be trivially
> open-coded by out-of-tree shite even if it happens to be non-GPL one.
>

Was this suggestion so bad that you have to insult not only the
author, but also people with speech impediments?

Sean


> >                                       mask =3D vfs_poll(f.file, wait);
> > +                                     if (f.file->f_op->poll) {
>
> ... not to mention that here you forgot to remove the call itself while
> expanding it.
>
> Said that, you are not attacking the worst part of it - it's a static
> branch, not the considerably more costly indirect ones.  Remember when
> I asked you about the price of those?  Method calls are costly.
>
> Another problem with with ->get_poll_head() calling conventions is
> that originally you wanted to return ERR_PTR(-mask) as a way to report
> not needing to call ->poll_mask(); that got shot down since quite
> a few of those don't fit into 12 bits that ERR_PTR() gives us.
>
> IIRC, the real reason for non-constant ->get_poll_head() was the sockets,
> with
>
> static struct wait_queue_head *sock_get_poll_head(struct file *file,
>                 __poll_t events)
> {
>         struct socket *sock =3D file->private_data;
>
>         if (!sock->ops->poll_mask)
>                 return NULL;
>         sock_poll_busy_loop(sock, events);
>         return sk_sleep(sock->sk);
> }
>
> The first part isn't a problem (it is constant).  The second is
> static inline void sock_poll_busy_loop(struct socket *sock, __poll_t even=
ts)
> {
>         if (sk_can_busy_loop(sock->sk) &&
>             events && (events & POLL_BUSY_LOOP)) {
>                 /* once, only if requested by syscall */
>                 sk_busy_loop(sock->sk, 1);
>         }
> }
>
> and the third -
>
> static inline wait_queue_head_t *sk_sleep(struct sock *sk)
> {
>         BUILD_BUG_ON(offsetof(struct socket_wq, wait) !=3D 0);
>         return &rcu_dereference_raw(sk->sk_wq)->wait;
> }
>
> Now, ->sk_wq is modified only in sock_init_data() and sock_graft();
> the latter, IIRC, is ->accept() helper.  Do we ever call either of
> those on a sock of already opened file?  IOW, is there any real
> reason for socket ->get_poll_head() not to be constant, other
> than wanting to keep POLL_BUSY_LOOP handling out of ->poll_mask()?
> I agree that POLL_BUSY_LOOP is ugly as hell, but you *still* have
> sock_poll_mask() not free from it...

--===============7451037627818736304==--

