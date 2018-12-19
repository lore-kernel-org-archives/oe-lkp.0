Content-Type: multipart/mixed; boundary="===============7350545708302696433=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [xarray] 4e99d4e957: BUG:soft_lockup-CPU##stuck_for#s
Date: Wed, 19 Dec 2018 17:54:24 +0800
Message-ID: <d6f5c0ce-1faf-dfc9-caf7-a233cc72d4a5@intel.com>
In-Reply-To: <20181211142947.GC6830@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7350545708302696433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/11/2018 10:29 PM, Matthew Wilcox wrote:
> On Tue, Dec 11, 2018 at 05:54:41PM +0800, kernel test robot wrote:
>> # To reproduce,
>> # 1) save job-script and this script (both are attached in 0day report e=
mail)
>> # 2) run this script with your compiled kernel and optional env $INSTALL=
_MOD_PATH
>>
>> kernel=3D$1
>>
>> initrds=3D(
>> 	/osimage/yocto/yocto-tiny-i386-2016-04-22.cgz
>> 	/lkp/lkp/lkp-i386.cgz
>> 	/osimage/deps/debian-x86_64-2016-08-31.cgz/run-ipconfig.i386_2016-09-03=
.cgz
>> )
>>
>> HTTP_PREFIX=3Dhttps://download.01.org/0day-ci/lkp-qemu
>> wget --timestamping "${initrds[@]/#/$HTTP_PREFIX}"
>>
>> {
>> 	cat "${initrds[@]//*\//}"
>> 	[[ $INSTALL_MOD_PATH ]] && (
>> 		cd "$INSTALL_MOD_PATH"
>>
>>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp qemu -k <bzImage> job-script # job-script is attached i=
n this email
> When I do this, the only output I get is:
>
> make: Entering directory '/home/willy/kernel/lkp-tests/bin/event'
> gcc    -c -o wakeup.o wakeup.c
> gcc  -static -o wakeup wakeup.o
> rm -f wakeup.o
> strip wakeup
> make: Leaving directory '/home/willy/kernel/lkp-tests/bin/event'
>
> Running under sh -x, I get as far as:
>
> + exec /home/willy/kernel/lkp-tests/lkp-exec/qemu -k ../idrext/.build-yoc=
to/arch/x86/boot/bzImage job-script
>
> Editing that script to set -x, I get to:
>
> + /home/willy/kernel/lkp-tests/sbin/pack -f -a x86_64 lkp-src
> make: Entering directory '/home/willy/kernel/lkp-tests/bin/event'
> gcc    -c -o wakeup.o wakeup.c
> gcc  -static -o wakeup wakeup.o
> rm -f wakeup.o
> strip wakeup
> make: Leaving directory '/home/willy/kernel/lkp-tests/bin/event'
> + exit
>
> which would seem to indicate your 'pack' command failed with a non-zero
> exit code?  Adding set -x to _that_ script gives me:
>
> + find . -type d -exec chmod g+rwx '{}' ';'
> + chmod -R g+rw etc lib root usr
> + '[' -d /osimage/addon-x86_64 ']'
> + gzip -n -9 /home/willy/.lkp/cache/lkp-x86_64.cpio
> + mv -f /home/willy/.lkp/cache/lkp-x86_64.cpio.gz /home/willy/.lkp/cache/=
lkp-x86_64.cgz
> + [[ -n '' ]]
> + [[ -n '' ]]
> + exit
>
> I'm using your top-of-tree lkp-tests, commit
> e28c726dfe85e3e595ba4776a4eb92f2559d3ac0
>
> By the way, I took this kernel config and ran it under one of your other
> test cases (the one which runs Trinity) and didn't see a boot problem,
> so either it's something specific to this setup, or the problem got
> fixed between this commit and current top-of-tree.

Please accept my apologies for taking your time, the reproduce tool was bro=
ken for a long time, and it's fixed now.
if it can't be reproduced, here is the original bzImage(https://download.01=
.org/0day-ci/lkp-qemu/fbc/4e99d4e9579d3b950bf4b38d0d64eb1b9be78761/).

Best Regards,
Rong Chen



--===============7350545708302696433==--

