Content-Type: multipart/mixed; boundary="===============3182150825679624323=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [LTP] 56cbb429d9: ltp.fs_fill.fail
Date: Fri, 26 Jul 2019 01:00:32 +0100
Message-ID: <20190726000032.GK1131@ZenIV.linux.org.uk>
In-Reply-To: <20190725180428.GH1131@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3182150825679624323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 07:04:28PM +0100, Al Viro wrote:
> On Thu, Jul 25, 2019 at 09:32:13AM -0700, Linus Torvalds wrote:
> > On Thu, Jul 25, 2019 at 6:26 AM Cyril Hrubis <chrubis@suse.cz> wrote:
> > >
> > > This looks like mkfs.vfat got EBUSY after the loop device was
> > > succesfully umounted.
> > =

> > Hmm. Smells like the RCU-delaying got triggered again.
> > =

> > We have that "synchronize_rcu_expedited()" in namespace_unlock(),
> > which is so that everything should be done by the time we return to
> > user space.
> > =

> > Al, maybe that RCU synchronization should be after the mntput()s?
> =

> There are several interesting issues in there, but synchronize_rcu()
> should be between zeroing ->mnt_ns and dropping the final refs.
> I'm digging through that crap right now; at least one bug is dealt
> with by #fixes, but there's more, unfortunately.

No, it's not synchronize_rcu().  It's a bug dealt with in vfs.git #fixes,
triggering the struct mount leak in mount_subtree(), which is used
by btrfs.  Immediately prior to vfat in their list...

(oh, and AFAICS "more" in the above had been a mismerge in -next, so
it might really be all there is to it)

Folks, see if vfs.git #fixes solves that one.

--===============3182150825679624323==--

