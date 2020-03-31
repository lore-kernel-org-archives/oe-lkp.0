Content-Type: multipart/mixed; boundary="===============4583348131249087889=="
MIME-Version: 1.0
From: Christian.Gromm@microchip.com
To: lkp@lists.01.org
Subject: Re: b276527539 ("staging: most: move core files out of the staging .."): [ 12.247349] BUG: kernel NULL pointer dereference, address: 00000000
Date: Tue, 31 Mar 2020 19:30:19 +0000
Message-ID: <3c8fefd9fadf217bc618b6558ce099aa6f76145e.camel@microchip.com>
In-Reply-To: <20200329133917.GE11705@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4583348131249087889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-03-29 at 21:39 +0800, kernel test robot wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> =

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad
> commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> staging-next
> =

> commit b276527539188f1f61c082ebef27803db93e536d
> Author:     Christian Gromm <christian.gromm@microchip.com>
> AuthorDate: Tue Mar 10 14:02:40 2020 +0100
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Tue Mar 24 13:42:44 2020 +0100
> =

>     staging: most: move core files out of the staging area
> =

>     This patch moves the core module to the /drivers/most directory
>     and makes all necessary changes in order to not break the build.
> =

>     Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
>     Link: =

> https://lore.kernel.org/r/1583845362-26707-2-git-send-email-christian.gro=
mm(a)microchip.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> =

> 22dd4acc80  Staging: speakup: Add identifier name to function
> declaration arguments.
> b276527539  staging: most: move core files out of the staging area
> e681bb287f  staging: vt6656: Use DIV_ROUND_UP macro instead of
> specific code
> +-------------------------------------------------------+----------
> --+------------+------------+
> >                                                       | 22dd4acc80
> > | b276527539 | e681bb287f |
> +-------------------------------------------------------+----------
> --+------------+------------+
> > boot_successes                                        |
> > 26         | 0          | 0          |
> > boot_failures                                         |
> > 8          | 11         | 11         |
> > WARNING:possible_circular_locking_dependency_detected |
> > 8          |            |            |
> > BUG:kernel_NULL_pointer_dereference,address           |
> > 0          | 11         | 11         |
> > Oops:#[##]                                            |
> > 0          | 11         | 11         |
> > EIP:__list_add_valid                                  |
> > 0          | 11         | 11         |
> > Kernel_panic-not_syncing:Fatal_exception              |
> > 0          | 11         | 11         |
> +-------------------------------------------------------+----------
> --+------------+------------+
> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> [   12.242090] no options.
> [   12.245364] FPGA DOWNLOAD --->
> [   12.245723] FPGA image file name: xlinx_fpga_firmware.bit
> [   12.246548] GPIO INIT FAIL!!
> [   12.246995] most_sound: init()
> [   12.247349] BUG: kernel NULL pointer dereference, address:
> 00000000
> [   12.248032] #PF: supervisor read access in kernel mode
> [   12.248322] #PF: error_code(0x0000) - not-present page
> [   12.248322] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53
> [   12.248322] Oops: 0000 [#1] PREEMPT SMP
> [   12.248322] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc7-
> 00376-gb276527539188 #1
> [   12.248322] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.12.0-1 04/01/2014
> [   12.248322] EIP: __list_add_valid+0x29/0x77
> [   12.248322] Code: c3 55 89 e5 56 53 83 ec 10 8b 59 04 39 d3 74 1a
> 89 4c 24 0c 89 5c 24 08 89 54 24 04 c7 04 24 00 cc bd c2 e8 84 9e b4
> ff 0f 0b <8b> 33 39 ce 74 1a 89 5c 24 0c 89 74 24 08 89 4c 24 04 c7
> 04 24 7c
> [   12.248322] EAX: c2f45800 EBX: 00000000 ECX: c3e8df50 EDX:
> 00000000
> [   12.248322] ESI: 00000000 EDI: ec4a7f68 EBP: ec4a7ee8 ESP:
> ec4a7ed0
> [   12.248322] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS:
> 00010246
> [   12.248322] CR0: 80050033 CR2: 00000000 CR3: 03256000 CR4:
> 001406b0
> [   12.248322] Call Trace:
> [   12.248322]  ? vprintk_func+0x9d/0xa7
> [   12.248322]  most_register_component+0x33/0x53

This function does a NULL check on the passed argument
struct most_component, berfore it calls list_add_tail().
So the dereferenced pointer must be the struct list_head
comp_list of the core.

> [   12.248322]  ? wilc_spi_driver_init+0x11/0x11
> [   12.248322]  audio_init+0x2c/0x76
> [   12.248322]  do_one_initcall+0xf0/0x284
> [   12.248322]  ? __might_sleep+0x70/0x77
> [   12.262064]  kernel_init_freeable+0x141/0x1a5
> [   12.262064]  ? rest_init+0x205/0x205
> [   12.262064]  kernel_init+0xb/0xea
> [   12.262064]  ? schedule_tail_wrapper+0x9/0xc
> [   12.262064]  ret_from_fork+0x2e/0x38
> [   12.262064] Modules linked in:
> [   12.262064] CR2: 0000000000000000
> [   12.262064] ---[ end trace 7c7a2cb6d11f9c5d ]---
> [   12.262064] EIP: __list_add_valid+0x29/0x77

which is weird, as the list_head used here is not dynamically
allocated and INIT_LIST_HEAD is definitely being called in the
__init function most_init() of the core module before its first
usage.

I've never seen the code failing at this point, nor has this
being reported by anyone yet.

Need to investigate.

thanks,
Chris


--===============4583348131249087889==--

