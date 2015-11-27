Content-Type: multipart/mixed; boundary="===============3394839355813942536=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] d0164adc89: -100.0% fsmark.app_overhead
Date: Fri, 27 Nov 2015 09:14:52 +0800
Message-ID: <87oaegmeer.fsf@yhuang-dev.intel.com>
In-Reply-To: <20151126132511.GG14880@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3394839355813942536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Mel,

Mel Gorman <mgorman@techsingularity.net> writes:

> On Thu, Nov 26, 2015 at 08:56:12AM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>> =

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> commit d0164adc89f6bb374d304ffcc375c6d2652fe67d ("mm, page_alloc:
>> distinguish between being unable to sleep, unwilling to sleep and
>> avoiding waking kswapd")
>> =

>> Note: the testing machine is a virtual machine with only 1G memory.
>> =

>
> I'm not actually seeing any problem here. Is this a positive report or
> am I missing something obvious?

Sorry the email subject is generated automatically and I forget to
change it to some meaningful stuff before sending out.  From the testing
result, we found the commit make the OOM possibility increased from 0%
to 100% on this machine with small memory.  I also added proc-vmstat
information data too to help diagnose it.

Best Regards,
Huang, Ying

--===============3394839355813942536==--

