Content-Type: multipart/mixed; boundary="===============4068313511607110047=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [scsi] ebc76736f2: fio.write_bw_MBps -4% regression
Date: Tue, 20 Jun 2017 10:16:36 +0800
Message-ID: <20170620021636.GH14764@yexl-desktop>
In-Reply-To: <20170619093913.GA15040@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4068313511607110047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Christoph

On 06/19, Christoph Hellwig wrote:
>On Mon, Jun 19, 2017 at 04:52:36PM +0800, Ye Xiaolong wrote:
>> >I've not seen a compile-time option for the MQ I/O scheduler (unlike
>> >the legacy one), so the way to change it would be to echo the name to
>> >/sys/block/<device>/queue/scheduler =

>> =

>> echo mq-deadline > /sys/block/<device>/queue/scheduler ?
>> =

>> I'll try and post the results once I get it.
>
>Thanks!

I've re-run the test and cat /sys/block/sda/queue/scheduler and
/sys/block/sda/queue/scheduler, and both showed "[mq-deadline] kyber none",
Does it mean they have already set as 'mq-deadline'?

Thanks,
Xiaolong

--===============4068313511607110047==--

