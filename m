Content-Type: multipart/mixed; boundary="===============5532654104097786397=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Wed, 17 Aug 2016 17:20:01 +0800
Message-ID: <80bbef60-34ed-0bf1-f1c5-8285b713c2f7@intel.com>
In-Reply-To: <CADvbK_dqSTArYJQGD9--vi4vyV-kfAg50=cK4oc7AhGzSwbLXQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5532654104097786397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/17/2016 04:58 PM, Xin Long wrote:
>>
>> It doesn't change on my desktop Sandybridge.
>>
>> $ cat 4.7.0-rc6-01199-g116558d316e8/0/netperf.json
>> {
>>   "netperf.Throughput_Mbps": [
>>    748.2056249999998
>>   ]
>> }
>>
>> Where commit 116558d316e8 is based on top of the last test commit
>> 98dd2532b14e with the sent_count removed.
> Nice job
> I guess it may be because of your system memory limitation
> =

> sctp_chunk size is bigger than before, netpref produced a lot
> of sctp_chunk in send queue.
> =

> can you check the memory of your systems when the test is
> running,  to see if memory is the bottle neck of this test ?

We have a monitor to dump /proc/meminfo every second during the run.

On my desktop, the result is -

At start:
time: 1471413103.386122645
MemTotal:       14193468 kB
MemFree:        13849136 kB
MemAvailable:   13789204 kB

In the middle of the run:
time: 1471413254.363430637
MemTotal:       14193468 kB
MemFree:        13811732 kB
MemAvailable:   13756376 kB

When the test is about to finish:
time: 1471413391.294215121
MemTotal:       14193468 kB
MemFree:        13286080 kB
MemAvailable:   13749416 kB

It doesn't seem memory is an issue.

The whole dump is about the same.
The MemFree and MemAvailable doesn't change much.

Thanks,
Aaron

--===============5532654104097786397==--

