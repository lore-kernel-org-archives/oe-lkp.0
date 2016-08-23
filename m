Content-Type: multipart/mixed; boundary="===============8364170878507224200=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Tue, 23 Aug 2016 17:19:54 +0800
Message-ID: <85b4c704-0598-bf18-92c5-edf04ab51597@intel.com>
In-Reply-To: <9ddf610d-c819-14ec-42b0-0ee61c0de173@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8364170878507224200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/23/2016 05:44 AM, Marcelo Ricardo Leitner wrote:
> Em 19-08-2016 04:24, Aaron Lu escreveu:
>> On Fri, Aug 19, 2016 at 04:19:39AM -0300, Marcelo Ricardo Leitner wrote:
>>> Hi,
>>>
>>> Em 19-08-2016 02:29, Aaron Lu escreveu:
>>> ...
>>>> It doesn't look insane and sctp_wait_for_sndbuf may actually have
>>>> something to do with a larger sctp_chunk I suppose?
>>>>
>>>> The same perf record doesn't capture any sample for the good commit,
>>>> which suggests the nerperf process doesn't sleep in sctp_wait_for_sndb=
uf.
>>>
>>> Ahhh yes! It does, and then it would mean your txbuf is too small for t=
he
>>> chunk sizes you're using (sctp tests option -m).
>>>
>>> What's your netperf cmdline again please?
>>
>> netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -H 127.0.0.1
>>
>> Is the 10K used here a problem? If so, can you suggest a proper value
>> for our netperf performance test? Thanks.
> =

> We're still working on this. Xin could reproduce it on an i3 too, but =

> I'm afraid this commit just unmasked an issue in there. You're =

> overloading the CPU by too much when spawning 8 parallel netperf's on a =

> 4-core system, seems that commit a6c2f79287 was that last rock that made =

> it slip into a precipice. sctp's cwnd and rwnd management are not as =

> good as tcp's and now it seems you're triggering a corner case.

OK, I see.

> =

> I hope to have more soon.

Looking forward to test your patches.
Thanks for the update.

Regards,
Aaron

--===============8364170878507224200==--

