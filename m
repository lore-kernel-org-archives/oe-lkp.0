Content-Type: multipart/mixed; boundary="===============6208261688831972219=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm/ptdump] 243b72aae2: WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page
Date: Tue, 28 Feb 2017 09:19:23 +0800
Message-ID: <20170228011923.GC9855@yexl-desktop>
In-Reply-To: <20170228011140.ef61008afb57976a74ead279@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6208261688831972219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/28, Masami Hiramatsu wrote:
>On Mon, 27 Feb 2017 16:01:34 +0300
>Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:
>
>> On 02/27/2017 04:03 AM, kernel test robot wrote:
>> > =

>> > FYI, we noticed the following commit:
>> > =

>> > commit: 243b72aae28ca1032284028323bb81c9235b15c9 ("x86/mm/ptdump: Opti=
mize check for W+X mappings for CONFIG_KASAN=3Dy")
>> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> =

>> ...
>> > =

>> > caused below changes (please refer to attached dmesg/kmsg for entire l=
og/backtrace):
>> > =

>> > =

>> > +-----------------------------------------------------+------------+--=
----------+
>> > |                                                     | 5b1ad68f9b | 2=
43b72aae2 |
>> > +-----------------------------------------------------+------------+--=
----------+
>> > | boot_successes                                      | 0          | 0=
          |
>> > | boot_failures                                       | 8          | 6=
          |
>> > | BUG:KASAN:slab-out-of-bounds                        | 8          | 6=
          |
>> > | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page | 0          | 6=
          |
>> > +-----------------------------------------------------+------------+--=
----------+
>> =

>> Ok, I reproduced this, but it's definitely caused *not* by 243b72aae28.
>> This WARN is also reproducible on the parent commit 5b1ad68f9b.
>> The only difference here is that on parent one needs dozens of seconds t=
o reach this WARNING.
>> It seems that this time difference somehow confused the robot.
>> =

>> As for the warning itself, it caused by kprobes. krpobe code use module_=
alloc() which
>> creates these RWX mappings.
>> I'm not sure how to fix this as AFAIK kprobes actually need RWX mapping.
>
>Thanks! I also noticed this issue. I actually have a plan to make kprobes =
with R+X mappings (as ftrace does).
>I'll queue this on my TODO list.
>

Good to know that, feel free to ask me to verify your fix if needed.

Thanks,
Xiaolong
>
>
>-- =

>Masami Hiramatsu <mhiramat@kernel.org>

--===============6208261688831972219==--

