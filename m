Content-Type: multipart/mixed; boundary="===============2758632997374531506=="
MIME-Version: 1.0
From: Guenter Roeck <linux@roeck-us.net>
To: lkp@lists.01.org
Subject: Re: [kallsyms] bf2d2b07db: kasan: GPF could be caused by NULL-ptr deref or user memory accessgeneral protection fault: 0000 [#1] general protection fault: 0000 [#1] PREEMPT PREEMPT KASANKASAN
Date: Mon, 01 Feb 2016 19:48:59 -0800
Message-ID: <56B0272B.9030704@roeck-us.net>
In-Reply-To: <20160201162006.fe29443a638368b4eecc456a@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2758632997374531506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/01/2016 04:20 PM, Andrew Morton wrote:
> On Thu, 28 Jan 2016 09:12:15 +0800 kernel test robot <ying.huang@linux.=
intel.com> wrote:
>
>> FYI, we noticed the below changes on
>>
>> https://git.linaro.org/people/ard.biesheuvel/linux-arm arm64-kaslr-v4a
>> commit bf2d2b07db19001ae0bd55826025b0ba47fae0c2 ("kallsyms: add support =
for relative offsets in kallsyms address table")
>>
>>
>> +-----------------------------------------------------------+-----------=
-+------------+
>> |                                                           | 2c4d21df0f=
 | bf2d2b07db |
>> +-----------------------------------------------------------+-----------=
-+------------+
>> | boot_successes                                            | 10        =
 | 0          |
>> | boot_failures                                             | 6         =
 | 36         |
>> | Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D | 2       =
   |            |
>> | IP-Config:Auto-configuration_of_network_failed            | 4         =
 |            |
>> | general_protection_fault:#[##]PREEMPT_PREEMPT_KASANKASAN  | 0         =
 | 36         |
>> | general_protection_fault:#[##]                            | 0         =
 | 36         |
>> | BUG:kernel_boot_hang                                      | 0         =
 | 36         |
>> +-----------------------------------------------------------+-----------=
-+------------+
>>
>>
>>
>> [    0.281636] kasan: CONFIG_KASAN_INLINE enabled
>>
>> [    0.282416] kasan: GPF could be caused by NULL-ptr deref or user memo=
ry access
>> [    0.282416] kasan: GPF could be caused by NULL-ptr deref or user memo=
ry accessgeneral protection fault: 0000 [#1] general protection fault: 0000=
 [#1] PREEMPT PREEMPT KASANKASAN
>>
>> [    0.284561] Modules linked in:
>> [    0.284561] Modules linked in:
>>
>> [    0.285136] CPU: 0 PID: 1 Comm: swapper Not tainted 4.5.0-rc1-00036-g=
bf2d2b0 #1
>> [    0.285136] CPU: 0 PID: 1 Comm: swapper Not tainted 4.5.0-rc1-00036-g=
bf2d2b0 #1
>> [    0.286438] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS Debian-1.8.2-1 04/01/2014
>> [    0.286438] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS Debian-1.8.2-1 04/01/2014
>> [    0.288000] task: ffff88000fcb0000 ti: ffff88000fcb8000 task.ti: ffff=
88000fcb8000
>> [    0.288000] task: ffff88000fcb0000 ti: ffff88000fcb8000 task.ti: ffff=
88000fcb8000
>> [    0.289287] RIP: 0010:[<ffffffff8120688c>]
>
> I'm not sufficiently familiar with KASAN to be able to interpret this.
> Perhaps Andrey can shed some light?
>
> The lack of symbol decoding is a problem.
>
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
>
> It should be there.  Perhaps it is not because this error is itself
> (possibly) related to kallsyms changes?
>

Probably. I had seen something similar (crash and no symbols) with an earli=
er version of the patch,
if the symbols were not created. There might be a message in the log, indic=
ating that kallsyms
failed to generate the symbols.

Guenter


--===============2758632997374531506==--

