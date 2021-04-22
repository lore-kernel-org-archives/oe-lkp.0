Content-Type: multipart/mixed; boundary="===============2211304047790871880=="
MIME-Version: 1.0
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: lkp@lists.01.org
Subject: Re: [null_blk] de3510e52b: blktests.block.014.fail
Date: Thu, 22 Apr 2021 04:08:09 +0000
Message-ID: <
 <BL0PR04MB6514B70E428937AD90679F3EE7469@BL0PR04MB6514.namprd04.prod.outlook.com>>
In-Reply-To: <20210422032959.GA31382@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2211304047790871880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021/04/22 12:12, Oliver Sang wrote:
> hi, Damien Le Moal,
> =

> On Wed, Apr 07, 2021 at 12:29:11PM +0000, Damien Le Moal wrote:
>> On 2021/04/07 18:02, kernel test robot wrote:
>>>
>>>
>>> Greeting,
>>>
>>> FYI, we noticed the following commit (built with gcc-9):
>>>
>>> commit: de3510e52b0a398261271455562458003b8eea62 ("null_blk: fix comman=
d timeout completion handling")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>
>>>
>>> in testcase: blktests
>>> version: blktests-x86_64-a210761-1_20210124
>>> with following parameters:
>>>
>>> 	disk: 1SSD
>>> 	test: nvme-group-00
>>> 	ucode: 0x11
>>>
>>>
>>>
>>> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz w=
ith 80G memory
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
>>>
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>
>>>
>>> block/014 (run null-blk with blk-mq and timeout injection configured)
>>> block/014 (run null-blk with blk-mq and timeout injection configured) [=
failed]
>>>     runtime  ...  71.624s
>>>     --- tests/block/014.out     2021-01-24 06:04:08.000000000 +0000
>>>     +++ /mnt/nvme-group-00/nodev/block/014.out.bad      2021-04-06 09:2=
1:25.133971868 +0000
>>>     @@ -1,2 +1,377 @@
>>>      Running block/014
>>>     +dd: error reading '/dev/nullb0': Connection timed out
>>>     +dd: error reading '/dev/nullb0': Connection timed out
>>>     +dd: error reading '/dev/nullb0': Connection timed out
>>>     +dd: error reading '/dev/nullb0': Connection timed out
>>>     +dd: error reading '/dev/nullb0': Connection timed out
>>>     +dd: error reading '/dev/nullb0': Connection timed out
>>>     ...
>>>     (Run 'diff -u tests/block/014.out /mnt/nvme-group-00/nodev/block/01=
4.out.bad' to see the entire diff)
>>
>> This is not a kernel bug. It is a problem with blktest. Before my patch,=
 the
>> timeout error was not propagated back to the user. It is now and causes =
dd to
>> fail. blktest seeing dd failing reports the test as failed. On the kerne=
l side,
>> all is good, the reqs are completed as expected.
>>
>> Note that the timeout error is reported back as is, using BLK_STS_TIMEOU=
T which
>> becomes ETIMEDOUT, hence the "Connection timed out" error message. May b=
e we
>> should use the more traditional EIO ? Jens ?
>>
>> In any case, I will send a patch to fix blktest block/014.
> =

> Thanks for information!
> we checked the latest blktest repo (https://github.com/osandov/blktests)
> but didn't find the fix. did we miss something?
> =

> when patch upstreamed, we could retest and confirm the fix. Thanks

I posted the patch:

https://www.spinics.net/lists/linux-block/msg66855.html

But I have not received any feedback from Omar yet (added on CC)



-- =

Damien Le Moal
Western Digital Research

--===============2211304047790871880==--

