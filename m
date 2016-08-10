Content-Type: multipart/mixed; boundary="===============6445544109029042390=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [nfsd] b44061d0b9: BUG: Dentry ffff880027d7c540{i=1846f, n=0a} still in use (1) [unmount of btrfs vda]
Date: Wed, 10 Aug 2016 11:56:15 -0700
Message-ID: <CA+55aFw5DczMkEYP47h=-9f6U2V5aQUhSxqPjtTbNp1Dd=gZwQ@mail.gmail.com>
In-Reply-To: <e6fb50d4-2a27-13cd-02c8-5b8439a16b3f@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6445544109029042390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 11:46 AM, Josef Bacik <jbacik@fb.com> wrote:
>
> So my naive fix would be something like this

Bruce? Josef's patch looks ObviouslyCorrect(tm) to me now that I look
at it - all the other callers of fh_compose() also seem to just drop
the dentry unconditionally, knowing that fh_compose() took a ref to it
if needed.

In fact, the only thing I'd do differently would be to not even put
the comment there at all, since this call site isn't any different
from any of the others. If anything, it could go on fh_compose() if we
want to add comments.

             Linus

--===============6445544109029042390==--

