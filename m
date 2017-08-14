Content-Type: multipart/mixed; boundary="===============0650617282480475000=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [net] 98cd1552ea: BUG:unable_to_handle_kernel
Date: Mon, 14 Aug 2017 11:04:30 -0700
Message-ID: <CA+55aFyfCFfanMnWGsER9k_jws6Qp_Oi0Z5UapFHsDschyYXJA@mail.gmail.com>
In-Reply-To: <20170814061032.GG23258@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0650617282480475000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 13, 2017 at 11:10 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
> FYI, we noticed the following commit:
>
> commit: 98cd1552ea27e512c7e99e2aa76042a26e4fb25c ("net: dsa: Mock-up driv=
er")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: trinity
> with following parameters:
>
>         runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
> +-----------------------------------------------------+------------+-----=
-------+
> |                                                     | 772c3bdad1 | 98cd=
1552ea |
> +-----------------------------------------------------+------------+-----=
-------+
> | boot_successes                                      | 0          | 0   =
       |
> | boot_failures                                       | 30         | 30  =
       |
> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page | 30         | 30  =
       |
> | invoked_oom-killer:gfp_mask=3D0x                      | 28         | 13=
         |
> | Mem-Info                                            | 28         | 13  =
       |
> | Out_of_memory:Kill_process                          | 28         | 13  =
       |
> | BUG:unable_to_handle_kernel                         | 0          | 16  =
       |
> | Oops:#[##]                                          | 0          | 16  =
       |
> | Kernel_panic-not_syncing:Fatal_exception            | 0          | 16  =
       |
> +-----------------------------------------------------+------------+-----=
-------+
>
> [    9.603869] BUG: unable to handle kernel NULL pointer dereference at 0=
0000000000001f0\

The code disassembly is

   0:   55                      push   %rbp
   1:   48 89 e5                mov    %rsp,%rbp
   4:   41 55                   push   %r13
   6:   41 54                   push   %r12
   8:   41 89 f4                mov    %esi,%r12d
   b:   53                      push   %rbx
   c:   48 8b 87 10 03 00 00    mov    0x310(%rdi),%rax
  13:   31 db                   xor    %ebx,%ebx
  15:*  4c 8b a8 f0 01 00 00    mov    0x1f0(%rax),%r13         <--
trapping instruction

which seems to be

        struct dsa_switch_tree *dst =3D dev->dsa_ptr;
        struct dsa_port *cpu_dp =3D dsa_get_cpu_port(dst);

where 'dst' is NULL (the "dsa_get_cpu_port() function is just an
inline that returns "dst->cpu_dp").

So 'dev' is not NULL, but dev->dsa_ptr definitely is.

                 Linus

--===============0650617282480475000==--

