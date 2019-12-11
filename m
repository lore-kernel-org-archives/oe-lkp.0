Content-Type: multipart/mixed; boundary="===============9189117948200793677=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [pipe] 3c0edea9b2: lmbench3.PIPE.bandwidth.MB/sec -17.0% regression
Date: Wed, 11 Dec 2019 22:52:19 +0800
Message-ID: <f96b092d-5b14-a795-819d-ad7536be4ba0@intel.com>
In-Reply-To: <CAHk-=wjj33OvL17p4XOjTjS-_MMEr5p0RqR9yLGhKWV3cgb57w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9189117948200793677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/11/2019 1:52 AM, Linus Torvalds wrote:
> On Tue, Dec 10, 2019 at 6:15 AM kernel test robot <rong.a.chen@intel.co=
m> wrote:
>> Hi Linus,
>>
>> Sorry for the inconvenience, indeed, the regression has been fixed.
> Woohoo.. And more than fixed, it looks like. Not that I looked at
> historical data, I'm not sure how much this number normally
> fluctuates. I'm assuming the stddev is just a per-boot "do it a few
> times" rather than any long-term thing?
>
>                  Linus

Hi Linus,

Yes, the stddev is not very precise, we usually boot more than three =

times to
get the value.

Best Regards,
Rong Chen


--===============9189117948200793677==--

