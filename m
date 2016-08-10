Content-Type: multipart/mixed; boundary="===============3848269767960041457=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [nfsd] b44061d0b9: BUG: Dentry ffff880027d7c540{i=1846f, n=0a} still in use (1) [unmount of btrfs vda]
Date: Wed, 10 Aug 2016 11:06:35 -0700
Message-ID: <CA+55aFxdcG4y4zWTFFT8SekEtxsvx12P+e=11kTCFc=zS__bXQ@mail.gmail.com>
In-Reply-To: <20160810053947.GG21941@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3848269767960041457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 9, 2016 at 10:39 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> [ 1537.558739] nfsd: last server has exited, flushing export cache
> [ 1540.627795] BUG: Dentry ffff880027d7c540{i=3D1846f,n=3D0a}  still in u=
se (1) [unmount of btrfs vda]
> [ 1540.633915] ------------[ cut here ]------------
> [ 1540.636551] WARNING: CPU: 0 PID: 20552 at fs/dcache.c:1474 umount_chec=
k+0x72/0x80

Hmm. Adding Al and the btrfs people to the cc, and expanding the nfs
list. Unlike the flakey-IO warning, this one sounds like a real issue.
Whether it's some dentry leak by nfsd or a VFS or btrfs issue, I can't
begin to guess. Al, ideas?

More information in the original email on lkml.

                 Linus

--===============3848269767960041457==--

