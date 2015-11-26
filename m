Content-Type: multipart/mixed; boundary="===============4980789726819612230=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm, page_alloc] d0164adc89: -100.0% fsmark.app_overhead
Date: Thu, 26 Nov 2015 10:03:01 -0500
Message-ID: <56571F25.5030905@redhat.com>
In-Reply-To: <20151126132511.GG14880@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4980789726819612230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/26/2015 08:25 AM, Mel Gorman wrote:
> On Thu, Nov 26, 2015 at 08:56:12AM +0800, kernel test robot wrote:
>> FYI, we noticed the below changes on
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> commit d0164adc89f6bb374d304ffcc375c6d2652fe67d ("mm, page_alloc: distin=
guish between being unable to sleep, unwilling to sleep and avoiding waking=
 kswapd")
>>
>> Note: the testing machine is a virtual machine with only 1G memory.
>>
>
> I'm not actually seeing any problem here. Is this a positive report or
> am I missing something obvious?

I've gotten several reports that could be either
positive or negative, but where I am not quite
sure how to interpret the results.

The tool seems to CC the maintainers of the code
that was changed, so I am hoping they will pipe
up when they see a problem.

Of course, that doesn't help in this case :)

--===============4980789726819612230==--

