Content-Type: multipart/mixed; boundary="===============0627721495833212023=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [scsi] ebc76736f2: fio.write_bw_MBps -4% regression
Date: Mon, 19 Jun 2017 16:52:36 +0800
Message-ID: <20170619085236.GB20152@yexl-desktop>
In-Reply-To: <20170619084153.GA14788@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0627721495833212023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/19, Christoph Hellwig wrote:
>On Mon, Jun 19, 2017 at 03:49:43PM +0800, Ye Xiaolong wrote:
>> On 06/19, Christoph Hellwig wrote:
>> >On Mon, Jun 19, 2017 at 02:03:18PM +0800, kernel test robot wrote:
>> >> =

>> >> Greeting,
>> >> =

>> >> FYI, we noticed a -4% regression of fio.write_bw_MBps due to commit:
>> >
>> >What does cat /sys/block/<device>/queue/scheduler say for your test?
>> >Can you try with mq-deadline or bfq and see what the results are?
>> =

>> Could you tell me how to do it? via changing kernel config?
>
>BFQ doesn't seem to be enabled in the config, so it would have to be
>enabled.
>
>I've not seen a compile-time option for the MQ I/O scheduler (unlike
>the legacy one), so the way to change it would be to echo the name to
>/sys/block/<device>/queue/scheduler =


echo mq-deadline > /sys/block/<device>/queue/scheduler ?

I'll try and post the results once I get it.

Thanks,
Xiaolong


--===============0627721495833212023==--

