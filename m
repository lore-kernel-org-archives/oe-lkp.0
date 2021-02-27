Content-Type: multipart/mixed; boundary="===============7695511981584525009=="
MIME-Version: 1.0
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: lkp@lists.01.org
Subject: Re: [blktrace] c055908abe: WARNING:at_kernel/trace/trace.c:#create_trace_option_files
Date: Sat, 27 Feb 2021 19:51:14 +0000
Message-ID: <
 <BYAPR04MB49650C1C244E99AB1FFC590E869C9@BYAPR04MB4965.namprd04.prod.outlook.com>>
In-Reply-To: <20210227094916.701a8a50@oasis.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============7695511981584525009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/27/21 06:49, Steven Rostedt wrote:
> On Sat, 27 Feb 2021 19:44:40 +0800
> kernel test robot <oliver.sang@intel.com> wrote:
>
>> [   20.216017] WARNING: CPU: 0 PID: 1 at kernel/trace/trace.c:8370 creat=
e_trace_option_files (kbuild/src/consumer/kernel/trace/trace.c:8370 (discri=
minator 1)) =

>> [   20.218480] Modules linked in:
>> [   20.219395] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-09341-gc=
055908abe0d #1
>> [   20.221182] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS 1.12.0-1 04/01/2014
>> [   20.224540] EIP: create_trace_option_files (kbuild/src/consumer/kerne=
l/trace/trace.c:8370 (discriminator 1)) =

>> [ 20.225816] Code: d5 01 83 15 2c b7 08 d5 00 83 c0 01 39 c8 0f 84 c7 00=
 00 00 8b 14 c7 39 72 44 75 df 83 05 10 b7 08 d5 01 83 15 14 b7 08 d5 00 <0=
f> 0b 83 05 18 b7 08 d5 01 83 15 1c b7 08 d5 00 83 05 20 b7 08 d5
> Looks to be from this:
>
>> +static struct tracer blk_tracer_ext __read_mostly =3D {
>> +	.name		=3D "blkext",
>> +	.init		=3D blk_tracer_init,
>> +	.reset		=3D blk_tracer_reset,
>> +	.start		=3D blk_tracer_start,
>> +	.stop		=3D blk_tracer_stop,
>> +	.print_header	=3D blk_tracer_print_header,
>> +	.print_line	=3D blk_tracer_print_line_ext,
>> +	.flags		=3D &blk_tracer_flags,
>                           ^^^
>
> As blk_tracer already registers those flags, when it gets registered as
> a tracer, and flag names can not be duplicated.
>
> I could fix the infrastructure to detect the same set of flags being
> registered by two different tracers, but in the mean time, it may still
> work to use the blk_trace_flags from blk_tracer, and keep .flags NULL
> here.
>
> -- Steve
Thanks for the reply Steve. This is still under currently discussion and
I'm still
waiting formore people to reply on this approach, if we end up having
this as
a part of final implementation we may need to fix that.

>
>> +	.set_flag	=3D blk_tracer_set_flag,
>> +};
>> +


--===============7695511981584525009==--

