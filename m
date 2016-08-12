Content-Type: multipart/mixed; boundary="===============6388049552456584559=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 12 Aug 2016 18:43:33 +0800
Message-ID: <20160812104333.GA4823@wfg-t540p.sh.intel.com>
In-Reply-To: <20160812100208.GA16044@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============6388049552456584559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, Aug 12, 2016 at 08:02:08PM +1000, Dave Chinner wrote:
>On Fri, Aug 12, 2016 at 04:51:24PM +0800, Ye Xiaolong wrote:
>> On 08/12, Ye Xiaolong wrote:
>> >On 08/12, Dave Chinner wrote:
>>
>> [snip]
>>
>> >>lkp-folk: the patch I've just tested it attached below - can you
>> >>feed that through your test and see if it fixes the regression?
>> >>
>> >
>> >Hi, Dave
>> >
>> >I am verifying your fix patch in lkp environment now, will send the
>> >result once I get it.
>> >
>>
>> Here is the test result.
>
>Which says "no change". Oh well, back to the drawing board...
>
>Can you send me the aim7 config file and command line you are using
>for the test?

The test scripts can be found here:

https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/tree/setup/d=
isk
https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/tree/setup/fs
https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/tree/tests/a=
im7

Here are the real commands they executed in this test:

modprobe -r brd
modprobe brd rd_nr=3D1 rd_size=3D50331648 part_show=3D1

dmsetup remove_all
wipefs -a --force /dev/ram0

mkfs -t xfs /dev/ram0
mkdir -p /fs/ram0
mount -t xfs -o nobarrier,inode64 /dev/ram0 /fs/ram0

for file in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
do
        echo performance > $file
done

echo "500 32000 128 512" > /proc/sys/kernel/sem

cat > workfile <<EOF
FILESIZE: 1M
POOLSIZE: 10M
10 disk_wrt
EOF

echo "/fs/ram0" > config

(
        echo ivb44
        echo disk_wrt

        echo 1
        echo 3000
        echo 2
        echo 3000
        echo 1
) | ./multitask -t

Thanks,
Fengguang

--===============6388049552456584559==--

