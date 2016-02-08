Content-Type: multipart/mixed; boundary="===============8343234681676946870=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [Xen-devel] Adding Xen to the kbuild bot?
Date: Mon, 08 Feb 2016 14:25:49 -0800
Message-ID: <CALCETrVA2b6_tT6Mb5Dpe8ChkWpLhb1wq=m-UsWSx64+EnJGWA@mail.gmail.com>
In-Reply-To: <56B8B347.40800@cardoe.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8343234681676946870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 8, 2016 at 7:24 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
> On 2/5/16 2:10 PM, Andy Lutomirski wrote:
>> On Feb 4, 2016 7:11 PM, "Fengguang Wu" <fengguang.wu@intel.com> wrote:
>>>
>>> Hi Andy,
>>>
>>> CC more people on Xen testing -- in case OSStest already (or plans to)
>>> cover such test case.
>>>
>>> On Tue, Feb 02, 2016 at 07:31:30PM -0800, Andy Lutomirski wrote:
>>>> Hi all-
>>>>
>>>> Would it make sense to add some basic Xen PV testing to the kbuild bot?
>>>
>>> Do you mean to run basic Xen testing on the various kernel trees that
>>> 0day robot covers? That is, to catch kernel regressions when running
>>> under Xen.
>>>
>>
>> Yes, exactly.  I've personally broken Linux as a Xen guest at least twic=
e.
>>
>>> If the intention is to catch Xen regressions, the OSStest
>>> infrastructure may be a better option:
>>>
>>>         git://xenbits.xen.org/osstest.git
>>
>> No, I think that 0day should pick one Xen version and stick with it
>> for a while rather than trying to track the latest version.
>>
>>>
>>>> qemu can boot Xen like this:
>>>>
>>>> qemu-system-x86_64 -kernel path/to/xen-4.5.2 -initrd 'path/to/bzImage
>>>> kernelarg otherkernelarg=3Dvalue" -append 'xenarg other_xen_arg'
>>>>
>>>> This should work with any kernel image for x86 or x86_64 with CONFIG_X=
EN=3Dy.
>>>
>>> Got it. If you have simple working test scripts to illustrate test
>>> details, it'd be a great help for integrating into OSStest or 0day.
>>
>> I have a script that will boot to a command prompt, but I don't know
>> if that's the right way to do it.  I'm not really sure how 0day works
>> under the hood, but treating Xen as a different configuration or arch
>> instead of treating it as a different test case might make more sense.
>>
>> --Andy
>>
>
> Andy,
>
> I'd be curious to see the script you use.

It's virtme with the --xen option.  You can see what it's doing by
adding --show-command --dry-run.

https://git.kernel.org/cgit/utils/kernel/virtme/virtme.git/

For Xen, I find I need to give it a decent amount of ram.  --qemu-opts
-m 1024 at the end seems to work.

This works out to:

/usr/bin/qemu-system-x86_64 -fsdev
local,id=3Dvirtfs1,path=3D/,security_model=3Dnone,readonly -device
virtio-9p-pci,fsdev=3Dvirtfs1,mount_tag=3D/dev/root -machine accel=3Dkvm:tcg
-watchdog i6300esb -cpu host -parallel none -net none -echr 1 -serial
none -chardev stdio,id=3Dconsole,signal=3Doff,mux=3Don -serial
chardev:console -mon chardev=3Dconsole -vga none -display none -kernel
xen-4.5.2 -initrd './arch/x86/boot/bzImage
init=3D/path/to/virtme/virtme/guest/virtme-init
earlyprintk=3Dserial,,ttyS0,,115200 console=3DttyS0 psmouse.proto=3Dexps
"virtme_stty_con=3Drows 35 cols 179 iutf8" TERM=3Dxterm-256color
rootfstype=3D9p rootflags=3Dversion=3D9p2000.L,,trans=3Dvirtio,,access=3Dany
raid=3Dnoautodetect ro' -m 1024

I can simplify this a lot to:

/usr/bin/qemu-system-x86_64 -fsdev
local,id=3Dvirtfs1,path=3D/,security_model=3Dnone,readonly -device
virtio-9p-pci,fsdev=3Dvirtfs1,mount_tag=3D/dev/root -machine accel=3Dkvm:tcg
-nographic -kernel xen-4.5.2 -initrd './arch/x86/boot/bzImage
earlyprintk=3Dserial,,ttyS0,,115200 console=3DttyS0 rootfstype=3D9p
rootflags=3Dversion=3D9p2000.L,,trans=3Dvirtio,,access=3Dany raid=3Dnoautod=
etect
ro init=3D/bin/bash' -m 1024

Using virtme's init works a lot better, though, if your goal is to get a sh=
ell.

--Andy

--===============8343234681676946870==--

