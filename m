Content-Type: multipart/mixed; boundary="===============4108753797649192839=="
MIME-Version: 1.0
From: Florian Fainelli <f.fainelli@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [net] 98cd1552ea: BUG:unable_to_handle_kernel
Date: Thu, 17 Aug 2017 14:47:18 -0700
Message-ID: <9fcb024e-8529-2c84-5553-3fbd42f4f374@gmail.com>
In-Reply-To: <CA+55aFyfCFfanMnWGsER9k_jws6Qp_Oi0Z5UapFHsDschyYXJA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4108753797649192839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/14/2017 11:04 AM, Linus Torvalds wrote:
> On Sun, Aug 13, 2017 at 11:10 PM, kernel test robot
> <xiaolong.ye@intel.com> wrote:
>> FYI, we noticed the following commit:
>>
>> commit: 98cd1552ea27e512c7e99e2aa76042a26e4fb25c ("net: dsa: Mock-up dri=
ver")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: trinity
>> with following parameters:
>>
>>         runtime: 300s
>>
>> test-description: Trinity is a linux system call fuzz tester.
>> test-url: http://codemonkey.org.uk/projects/trinity/
>>
>> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 1G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>> +-----------------------------------------------------+------------+----=
--------+
>> |                                                     | 772c3bdad1 | 98c=
d1552ea |
>> +-----------------------------------------------------+------------+----=
--------+
>> | boot_successes                                      | 0          | 0  =
        |
>> | boot_failures                                       | 30         | 30 =
        |
>> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page | 30         | 30 =
        |
>> | invoked_oom-killer:gfp_mask=3D0x                      | 28         | 1=
3         |
>> | Mem-Info                                            | 28         | 13 =
        |
>> | Out_of_memory:Kill_process                          | 28         | 13 =
        |
>> | BUG:unable_to_handle_kernel                         | 0          | 16 =
        |
>> | Oops:#[##]                                          | 0          | 16 =
        |
>> | Kernel_panic-not_syncing:Fatal_exception            | 0          | 16 =
        |
>> +-----------------------------------------------------+------------+----=
--------+
>>
>> [    9.603869] BUG: unable to handle kernel NULL pointer dereference at =
00000000000001f0\
> =

> The code disassembly is
> =

>    0:   55                      push   %rbp
>    1:   48 89 e5                mov    %rsp,%rbp
>    4:   41 55                   push   %r13
>    6:   41 54                   push   %r12
>    8:   41 89 f4                mov    %esi,%r12d
>    b:   53                      push   %rbx
>    c:   48 8b 87 10 03 00 00    mov    0x310(%rdi),%rax
>   13:   31 db                   xor    %ebx,%ebx
>   15:*  4c 8b a8 f0 01 00 00    mov    0x1f0(%rax),%r13         <--
> trapping instruction
> =

> which seems to be
> =

>         struct dsa_switch_tree *dst =3D dev->dsa_ptr;
>         struct dsa_port *cpu_dp =3D dsa_get_cpu_port(dst);
> =

> where 'dst' is NULL (the "dsa_get_cpu_port() function is just an
> inline that returns "dst->cpu_dp").
> =

> So 'dev' is not NULL, but dev->dsa_ptr definitely is.

(was on vacation hence the reply just now).

I could spot two possible problems in
net/dsa/slave.c::dsa_cpu_port_get_sset_count which is that we do this:

	if (cpu_dp->ethtool_ops.get_sset_count)
		count +=3D cpu_dp->ethtool_ops.get_sset_count(dev, sset);

	if (sset =3D=3D ETH_SS_STATS && ds->ops->get_sset_count)
                count +=3D ds->ops->get_sset_count(ds);

and the very first thing that ethtool_get_drvinfo() does is call this
function with ETH_SS_TEST, so we could be returning a greater number of
strings than we actually support. So at least we should be checking for
sset !=3D ETH_SS_STATS as a first thing. That is tangential to the problem
IMHO.

Now as far as dev->dsa_ptr being NULL, I suppose the problem could be a
race condition of some sort in that we have the following:

Thread 0			Thread 1

mutex_lock(&dsa2_mutex);
dsa_register_switch()
dsa_dst_apply()
dsa_ds_apply()
dsa_user_port_apply()
dsa_slave_create()
register_netdev()

notifiers run here
				systemd-udevd gets scheduled
				...
				ethtool_get_drvinfo()
...

dst->cpu_dp->netdev->dsa_ptr =3D dst
mutex_unlock(&dsa2_mutex);

So we could be allowing programs to query network devices that we just
created with an intermediate state. I am a bit wary of moving the dst
assignment *before* dsa_ds_apply(), Andrew do you see any adverse effect
if we do that though?
-- =

Florian

--===============4108753797649192839==--

