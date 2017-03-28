Content-Type: multipart/mixed; boundary="===============3450059524763934009=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [fsnotify] 55a6cc54da [ 1.790337] BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Tue, 28 Mar 2017 11:57:03 +0200
Message-ID: <20170328095703.GC1370@quack2.suse.cz>
In-Reply-To: <20170328091407.aw6nhom5wp4jmbuj@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3450059524763934009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang!

On Tue 28-03-17 17:14:07, Wu Fengguang wrote:
> FYI, this bug may only hurt bisects.
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_tes=
ting
> =

> commit 55a6cc54da595bb3b2a34e188818ef39026c8c4e
> Author:     Jan Kara <jack@suse.cz>
> AuthorDate: Wed Feb 1 08:19:43 2017 +0100
> Commit:     Jan Kara <jack@suse.cz>
> CommitDate: Sun Mar 19 19:07:11 2017 +0100
> =

>      fsnotify: Lock object list with connector lock

Yeah, it was a problem introduced by this patch and fixed by the following
one. But still. Thanks for catching this, I've fixed it up.

								Honza

--
Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============3450059524763934009==--

