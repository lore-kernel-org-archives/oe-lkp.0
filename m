Content-Type: multipart/mixed; boundary="===============0046404874989968719=="
MIME-Version: 1.0
From: Bart Van Assche <bvanassche@acm.org>
To: lkp@lists.01.org
Subject: Re: [scsi] 74eb6c22dc: suspend_stress.fail
Date: Wed, 13 Nov 2019 09:00:29 -0800
Message-ID: <cb814a0c-c636-e9f4-654a-3f21bd0db646@acm.org>
In-Reply-To: <20191105061150.GA17084@ming.t460p>
List-Id: <oe-lkp.lists.linux.dev>

--===============0046404874989968719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/4/19 10:11 PM, Ming Lei wrote:
> On Mon, Nov 04, 2019 at 07:52:59PM -0800, Bart Van Assche wrote:
>> On 2019-11-04 00:50, kernel test robot wrote:
>>> FYI, we noticed the following commit (built with gcc-7):
>>>
>>> commit: 74eb6c22dc70e395b333c9ca579855cd88db8845 ("[RFC PATCH V3 2/2] s=
csi: core: don't limit per-LUN queue depth for SSD")
>>> url: https://github.com/0day-ci/linux/commits/Ming-Lei/scsi-core-avoid-=
host-wide-host_busy-counter-for-scsi_mq/20191009-015827
>>> base: https://git.kernel.org/cgit/linux/kernel/git/jejb/scsi.git for-ne=
xt
>>>
>>> in testcase: suspend_stress
>>> with following parameters:
>>>
>>> 	mode: freeze
>>> 	iterations: 10
>>
>> Hi Ming,
>>
>> This is the second report by the build robot that this patch causes the
>> suspend_stress test to fail. I assume that that means that that test
>> failure is not a coincidence. The previous report (Oct-22) is available
>> at https://lore.kernel.org/linux-scsi/20191023003027.GD12647(a)shao2-deb=
ian/.
> =

> Yeah, it should be one real issue, and there are other issues too. I will=
 work
> out a new version for addressing all.

Hi Ming,

Have you already made any progress? I'm asking because the v5.5 merge =

window is expected to open soon (this weekend).

Thanks,

Bart.
--===============0046404874989968719==--

