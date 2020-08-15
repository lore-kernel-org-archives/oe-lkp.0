Content-Type: multipart/mixed; boundary="===============4105510793583324679=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 3e38e0aaca: WARNING:at_mm/memcontrol.c:#mem_cgroup_alloc
Date: Sat, 15 Aug 2020 20:45:47 +0800
Message-ID: <20200815124547.GA21072@intel.com>
In-Reply-To: <CAHk-=wj8oc=wCvqcMdpKM8cceEYmicpf++rNDWC_5A6qYDP9QQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4105510793583324679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 10:00:44AM -0700, Linus Torvalds wrote:
> On Fri, Aug 14, 2020 at 7:14 AM kernel test robot <lkp@intel.com> wrote:
> >
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: 3e38e0aaca9eafb12b1c4b731d1c10975cbe7974 ("mm: memcg: charge me=
mcg percpu memory to the parent cgroup")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> >
> > in testcase: boot
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 8G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> =

> This should have already been fixed by commit 9f457179244a ("mm:
> memcontrol: fix warning when allocating the root cgroup").
Thanks Linus for this info, usually the test bot checks the head
of fbc's branch to validate the bisection. If the head fixes
the issue, the bot shall not send out such fbc report. We will
double check this bisection process to resolve any logical issue.

> =

> But I forget what the syntax is to report that to the kernel test
> robot. Would it be possible for lkp automatically look for "Fixes:"
> tags, perhaps?
Got it, we will investigate this which should be quite helpful, e.g. if
we want to check whether an upstream commit had fixes in other
repo like linux-next.

Thanks

> =

>                  Linus
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============4105510793583324679==--

