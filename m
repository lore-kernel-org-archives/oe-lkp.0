Content-Type: multipart/mixed; boundary="===============4621574388369550354=="
MIME-Version: 1.0
From: Corey Minyard <minyard@acm.org>
To: lkp@lists.01.org
Subject: Re: [ipmi] BUG: key ffff880fcfc51ed0 not in .data!
Date: Wed, 17 Dec 2014 07:03:56 -0600
Message-ID: <54917F3C.4090007@acm.org>
In-Reply-To: <CAADnVQLerROn=H=w0T29wt-wO=SbHaggrso_B7aGCajrAJ3TvA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4621574388369550354==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/16/2014 07:05 PM, Alexei Starovoitov wrote:
> On Tue, Dec 16, 2014 at 5:08 AM, Corey Minyard <cminyard@mvista.com> wr=
ote:
>> Yes, should be fixed by:
>>
>> commit 693726299ba87a6e267993806bc1320a266e5c5e
>> Author: Corey Minyard <cminyard@mvista.com>
>> Date:   Fri Dec 12 19:06:07 2014 -0600
>>
>>     ipmi: Finish cleanup of BMC attributes
>>
>> which should be in linux-next now.  I was able to reproduce and verify
>> that this fixed it.  I've verified that the branch is correct in the
>> repository.
> thanks. cleared the warning for me as well:
> Tested-by: Alexei Starovoitov <ast@plumgrid.com>
>
> Are you planning to send a pull request
> before the merge window is over or for rc2 ?

Yes, I believe I will.  I was planning to wait until it was in
linux-next for a little while, but a "Tested-by" from you and Huang Ying
would give me more confidence :).

-corey

--===============4621574388369550354==--

