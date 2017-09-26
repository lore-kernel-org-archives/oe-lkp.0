Content-Type: multipart/mixed; boundary="===============7856239977569483574=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/fpu] 8d3e268d89: WARNING:at_arch/x86/kernel/fpu/core.c:#fpu__read
Date: Tue, 26 Sep 2017 09:46:06 +0200
Message-ID: <20170926074606.idqkvcbkminhno4t@gmail.com>
In-Reply-To: <20170926021921.GG17200@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7856239977569483574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <xiaolong.ye@intel.com> wrote:

> =

> FYI, we noticed the following commit:
> =

> commit: 8d3e268d89523abba613763da67c7eb47a744ad7 ("x86/fpu: Rename fpu__a=
ctivate_fpstate_read/write() to fpu__read/write()")
> git://internal_merge_and_test_tree revert-8d3e268d89523abba613763da67c7eb=
47a744ad7-8d3e268d89523abba613763da67c7eb47a744ad7

Ok, that's not the guilty commit (it's a simple rename), but I think I know=
 what =

the problem was, and have fixed tip:WIP.x86/fpu accordingly. This warning s=
hould =

be gone with the latest trees.

Thanks,

	Ingo

--===============7856239977569483574==--

