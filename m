Content-Type: multipart/mixed; boundary="===============6387266058690752730=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: Manually using 0-day test service
Date: Fri, 05 May 2017 07:03:58 +0800
Message-ID: <20170504230358.i2unrfwoatyr7txq@wfg-t540p.sh.intel.com>
In-Reply-To: <CAEXv5_i7+g-AmAbsLzEr97mf7=BOjpD3pnSfpBoh+S4p5p4xpQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6387266058690752730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, May 04, 2017 at 07:48:03AM -0400, David Windsor wrote:
>Hi,
>
>Can you please integrate the following git tree into the 0-day testing
>framework?
>
>https://github.com/dwindsor/kspp/tree/slabcache-usercopy
>
>This tree is being used to stage the slabcache whitelisting feature
>for hardened usercopy, a Linux kernel hardening feature part of KSPP
>(the Linux Kernel Self-Protection Project).

My pleasures. I just sent the patch and the auto testing will take
effect when deployed.

Thanks,
Fengguang

>On Tue, Feb 21, 2017 at 9:55 AM, Fengguang Wu <fengguang.wu@intel.com> w=
rote:
>> Hi David,
>>
>> On Tue, Feb 21, 2017 at 09:48:15AM -0500, David Windsor wrote:
>>>
>>> Hi,
>>>
>>> I'm wondering if it's possible to submit a patch directly to the 0-day
>>> test service, rather than having the patch picked up after being
>>> submitted to another mailing list?  I'm attempting to leverage the
>>> 0-day test infrastructure to find any build errors before submitting
>>> them upstream, if at all possible.
>>
>>
>> For that purpose the best way is to setup a public git tree (eg. on
>> github) and tell us the URL. Then you can simply "git push" and we can
>> simply pick it up w/o having to worry about the patch's base commit
>> tagging (on your part) or guessing (on our part).
>>
>>>> From what I've read on 01.org, it seems that a likely plan would be to
>>>
>>> submit the patch to kbuild(a)lists.01.org, but how do I specify the
>>> correct tree to apply my patch against?
>>
>>
>> By exposing a git tree (with your patches committed) to us directly. :)
>>
>> Thanks,
>> Fengguang

--===============6387266058690752730==--

