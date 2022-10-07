Content-Type: multipart/mixed; boundary="===============1216883620431298698=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] 763ecb0350: kernel_BUG_at_mm/mmap.c
Date: Fri, 07 Oct 2022 02:34:30 -0600
Message-ID: <CAOUHufZsXJ4ixqpQEEuifFT_h5Ht6R685QU-At8M-r7ic2tEzQ@mail.gmail.com>
In-Reply-To: <CAOUHufaUFd9umLvR2P11m7o=RsWWAOsKoCPOk=YZ0TggTpiB4g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1216883620431298698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 6, 2022 at 6:47 PM Yu Zhao <yuzhao@google.com> wrote:
>
> On Wed, Oct 5, 2022 at 9:30 AM kernel test robot <oliver.sang@intel.com=
> wrote:
> >
> >
> > Greeting,
> >
> > FYI, we noticed the following commit (built with gcc-11):
> >
> > commit: 763ecb035029f500d7e6dc99acd1ad299b7726a1 ("mm: remove the vma l=
inked list")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >
> > in testcase: trinity
> > version: trinity-static-i386-x86_64-1c734c75-1_2020-01-06
> > with following parameters:
> >
> >         runtime: 300s
> >         group: group-03
> >
> > test-description: Trinity is a linux system call fuzz tester.
> > test-url: http://codemonkey.org.uk/projects/trinity/
> >
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 16G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> >
> >
> >
> > If you fix the issue, kindly add following tag
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Link: https://lore.kernel.org/r/202210052318.5ad10912-oliver.sang(a)i=
ntel.com
> >
> >
> > [   63.390267][ T5018] ------------[ cut here ]------------
> > [   63.391875][ T5018] kernel BUG at mm/mmap.c:3167!
> > [   63.393264][ T5018] invalid opcode: 0000 [#1] SMP PTI
> > [   63.394501][ T5018] CPU: 1 PID: 5018 Comm: trinity-c1 Not tainted 6.=
0.0-rc3-00284-g763ecb035029 #1
> > [   63.396050][ T5018] Hardware name: QEMU Standard PC (i440FX + PIIX, =
1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> > [ 63.397726][ T5018] RIP: 0010:exit_mmap (mm/mmap.c:3167 (discriminator=
 1))
>
> Thanks, Oliver.
>
> The attached dmesg doesn't say much. My guess is the oom reaper jumped
> in between
>
>         mmap_read_unlock(mm);
>
>         /*
>          * Set MMF_OOM_SKIP to hide this task from the oom killer/reaper
>          * because the memory has been already freed.
>          */
>         set_bit(MMF_OOM_SKIP, &mm->flags);
>         mmap_write_lock(mm);
>
> It seems to me we need to hold the lock for write all the time. But
> there is probably a reason we didn't do it in the first place.

Apparently this is safe: I checked all places that change VMAs and
none of them can race with the above (oom reaper was a red herring).
--===============1216883620431298698==--

