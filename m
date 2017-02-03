Content-Type: multipart/mixed; boundary="===============5362064808389789570=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] df387eae80: blogbench.write_score -59% regression
Date: Fri, 03 Feb 2017 16:51:40 +0800
Message-ID: <20170203085140.GA5957@yexl-desktop>
In-Reply-To: <20170203084120.GA27206@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============5362064808389789570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/03, Christoph Hellwig wrote:
>On Fri, Feb 03, 2017 at 09:44:00AM +0800, kernel test robot wrote:
>> =

>> Greeting,
>> =

>> FYI, we noticed a -59% regression of blogbench.write_score due to commit:
>> =

>> =

>> commit: df387eae801490e939f31eab47f47d87ab85b582 ("enable discard by def=
ault")
>> git://git.infradead.org/users/hch/vfs xfs-async-discard.5
>
>Hi Xiaolong,

Hi, Christoph

>
>do you also have numbers for the whole branch?  Or should I reorder

Do you mean test data for 7f7bfe47 (xfs: wait for discards before retrying =
an allocation due to busy extents) ?
I'll need to check whether 0day bot has launched test for it or not.

Thanks,
Xiaolong

>the branch to move the enable last to get those in another run?

--===============5362064808389789570==--

