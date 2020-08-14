Content-Type: multipart/mixed; boundary="===============2536776085916759457=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] 3e38e0aaca: WARNING:at_mm/memcontrol.c:#mem_cgroup_alloc
Date: Fri, 14 Aug 2020 10:00:44 -0700
Message-ID: <CAHk-=wj8oc=wCvqcMdpKM8cceEYmicpf++rNDWC_5A6qYDP9QQ@mail.gmail.com>
In-Reply-To: <20200814141327.GJ7488@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2536776085916759457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 7:14 AM kernel test robot <lkp@intel.com> wrote:
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 3e38e0aaca9eafb12b1c4b731d1c10975cbe7974 ("mm: memcg: charge memc=
g percpu memory to the parent cgroup")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

This should have already been fixed by commit 9f457179244a ("mm:
memcontrol: fix warning when allocating the root cgroup").

But I forget what the syntax is to report that to the kernel test
robot. Would it be possible for lkp automatically look for "Fixes:"
tags, perhaps?

                 Linus
--===============2536776085916759457==--

