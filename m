Content-Type: multipart/mixed; boundary="===============0598634697531686567=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [selftests/bpf] 37f1ba0909: kernel_selftests.bpf.test_dev_cgroup.fail
Date: Wed, 03 Jan 2018 14:08:24 +0000
Message-ID: <20180103140819.GA15762@castle.DHCP.thefacebook.com>
In-Reply-To: <20180103025541.GA12392@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0598634697531686567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2018 at 10:55:41AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 37f1ba0909dfa12c75f8e8ea7a2f01355ebd60f1 ("selftests/bpf: add a t=
est for device cgroup controller")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Hello!

This issue has already been fixed by commit 06ef0ccb5a36
("bpf/cgroup: fix a verification error for a CGROUP_DEVICE type prog").

Thanks!

--===============0598634697531686567==--

