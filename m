Content-Type: multipart/mixed; boundary="===============3591334124642239712=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Mon, 03 Oct 2016 10:32:04 +0800
Message-ID: <CADvbK_f7ihdJJvxmmBNA7_1fV2=eyxEqCQztm7LKz+vp8rSHig@mail.gmail.com>
In-Reply-To: <2019939b-df57-2b02-287d-fcba0f07c57c@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3591334124642239712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2016 at 3:05 PM, Aaron Lu <aaron.lu@intel.com> wrote:
> On 08/23/2016 05:44 AM, Marcelo Ricardo Leitner wrote:
>> Em 19-08-2016 04:24, Aaron Lu escreveu:
>>> On Fri, Aug 19, 2016 at 04:19:39AM -0300, Marcelo Ricardo Leitner wrote:
>>>> Hi,
>>>>
>>>> Em 19-08-2016 02:29, Aaron Lu escreveu:
>>>> ...
>>>>> It doesn't look insane and sctp_wait_for_sndbuf may actually have
>>>>> something to do with a larger sctp_chunk I suppose?
>>>>>
>>>>> The same perf record doesn't capture any sample for the good commit,
>>>>> which suggests the nerperf process doesn't sleep in sctp_wait_for_snd=
buf.
>>>>
>>>> Ahhh yes! It does, and then it would mean your txbuf is too small for =
the
>>>> chunk sizes you're using (sctp tests option -m).
>>>>
>>>> What's your netperf cmdline again please?
>>>
>>> netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -H 127.0.0.1
>>>
>>> Is the 10K used here a problem? If so, can you suggest a proper value
>>> for our netperf performance test? Thanks.
>>
>> We're still working on this. Xin could reproduce it on an i3 too, but
>> I'm afraid this commit just unmasked an issue in there. You're
>> overloading the CPU by too much when spawning 8 parallel netperf's on a
>> 4-core system, seems that commit a6c2f79287 was that last rock that made
>> it slip into a precipice. sctp's cwnd and rwnd management are not as
>> good as tcp's and now it seems you're triggering a corner case.
>>
>> I hope to have more soon.
>
> I wonder if there is any update on this issue?
>
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

be4947b sctp: change to check peer prsctp_capable when using prsctp polices
0605483 sctp: remove prsctp_param from sctp_chunk
73dca12 sctp: move sent_count to the memory hole in sctp_chunk

These three commit can avoid this issue by recovering sctp_chunk size.

--===============3591334124642239712==--

