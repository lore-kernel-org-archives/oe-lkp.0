Content-Type: multipart/mixed; boundary="===============2690737214802049111=="
MIME-Version: 1.0
From: J. Bruce Fields <bfields@redhat.com>
To: lkp@lists.01.org
Subject: Re: [nfsd] b44061d0b9: BUG: Dentry ffff880027d7c540{i=1846f, n=0a} still in use (1) [unmount of btrfs vda]
Date: Wed, 10 Aug 2016 15:09:16 -0400
Message-ID: <20160810190915.GA22411@pad>
In-Reply-To: <CA+55aFw5DczMkEYP47h=-9f6U2V5aQUhSxqPjtTbNp1Dd=gZwQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2690737214802049111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 11:56:15AM -0700, Linus Torvalds wrote:
> On Wed, Aug 10, 2016 at 11:46 AM, Josef Bacik <jbacik@fb.com> wrote:
> >
> > So my naive fix would be something like this
> =

> Bruce? Josef's patch looks ObviouslyCorrect(tm) to me now that I look
> at it - all the other callers of fh_compose() also seem to just drop
> the dentry unconditionally, knowing that fh_compose() took a ref to it
> if needed.
> =

> In fact, the only thing I'd do differently would be to not even put
> the comment there at all, since this call site isn't any different
> from any of the others. If anything, it could go on fh_compose() if we
> want to add comments.

Yep, makes sense to me too.

OK with me if you want to take it, otherwise I'll run it through my
usual tests and send you a pull request probably today or tomorrow.

Thanks, Josef!  (And kernel test robot folks--the speed with which
they're catching stuff, and bisecting down to individual commits, is
really amazing to me.)

--b.

--===============2690737214802049111==--

