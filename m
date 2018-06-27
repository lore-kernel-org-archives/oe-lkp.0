Content-Type: multipart/mixed; boundary="===============5700007307618988988=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Wed, 27 Jun 2018 09:07:45 +0200
Message-ID: <20180627070745.GA9765@lst.de>
In-Reply-To: <20180626060338.GU12146@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5700007307618988988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2018 at 02:03:38PM +0800, Ye Xiaolong wrote:
> Hi,
> =

> On 06/22, Christoph Hellwig wrote:
> >Hi Xiaolong,
> >
> >can you retest this workload on the following branch:
> >
> >    git://git.infradead.org/users/hch/vfs.git remove-get-poll-head
> >
> >Gitweb:
> >
> >    http://git.infradead.org/users/hch/vfs.git/shortlog/refs/heads/remov=
e-get-poll-head
> =

> Here is the comparison for commit 3deb642f0d and commit 8fbedc1 ("fs: rep=
lace f_ops->get_poll_head with a static ->f_poll_head pointer") in remove-g=
et-poll-head branch.

Especially the boot time ones and others look like they have additional
changes.

Can you compare the baseline of my tree, which is
894b8c00 ("Merge tag 'for_v4.18-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs") against 8fbed=
c1
(("fs: replace f_ops->get_poll_head with a static ->f_poll_head pointer") ?

--===============5700007307618988988==--

