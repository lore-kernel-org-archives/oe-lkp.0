Content-Type: multipart/mixed; boundary="===============2930605284967713842=="
MIME-Version: 1.0
From: Shuah Khan <skhan@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] selftests/ir: fix build with ancient kernel headers
Date: Tue, 01 Feb 2022 10:42:18 -0700
Message-ID: <bb937121-64e4-ea34-e97b-a555ba283a5d@linuxfoundation.org>
In-Reply-To: <YflpnYECZE2Kxh+V@gofer.mess.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2930605284967713842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/1/22 10:10 AM, Sean Young wrote:
> On Tue, Feb 01, 2022 at 04:58:48PM +0000, Matthew Wilcox wrote:
>> On Tue, Feb 01, 2022 at 04:53:11PM +0000, Sean Young wrote:
>>> +/* Support ancient lirc.h which does not have these values */
>>
>> Can we have a little more information here, such as "Can be removed once
>> RHEL 8 is no longer a relevant testing platform"?  That will save people
>> doing archaology to find out when it's safe to remove.
> =

> That totally makes sense.
> =

> Having said that, I have no idea what platforms are being used for testin=
g,
> so I don't know if RHEL 8 is the only one that needs this. Is there anyone
> who could shed some light on what platforms should be supported?
> =

> Thanks,
> =

> Sean
> =


Sean,

It isn't important on platforms that get tested. We really don't have much
control over the platforms these tests get run.

Let's add a FIXME to remove and also add link to the kbuild thread where wi=
th
the discussion.

I am assuming this has to go through bpf since it fixes the commit already
in that tree:

With the change Matthew requested,

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Or I can take this through my tree.

thanks,
-- SHuah

--===============2930605284967713842==--

