Content-Type: multipart/mixed; boundary="===============6738943632853673915=="
MIME-Version: 1.0
From: Paolo Abeni <pabeni@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [udp] bc0d3d0639: apachebench.requests_per_second -21% regression
Date: Wed, 07 Jun 2017 23:40:06 +0200
Message-ID: <1496871606.2593.2.camel@redhat.com>
In-Reply-To: <20170607021229.GJ2969@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6738943632853673915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 2017-06-07 at 10:12 +0800, kernel test robot wrote:
> To reproduce:
> =

>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml

I tried to reproduce the tests with the above steps, and I have a few
questions.

On a centos 7.3 distro I get (after a successful install step)

# bin/lkp run ~/job.yaml=C2=A0
2017-06-07 12:18:39=C2=A0
for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
do
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0online_file=3D"$cpu_dir"/on=
line
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[ -f "$online_file" ] && [ =
"$(cat "$online_file")" -eq 0 ] && continue

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0file=3D"$cpu_dir"/cpufreq/s=
caling_governor
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[ -f "$file" ] && echo "$sc=
aling_governor" > "$file"
done

IPMI Device Information
kill 5398 vmstat --timestamp -n 10=C2=A0
kill 5393 dmesg --follow --decode=C2=A0
kill 5540 mpstat 1=C2=A0
kill 5534 /usr/bin/perf stat -a -I 1000 -x=C2=A0=C2=A0-e cpu-clock,task-clo=
ck,page-faults,context-switches,cpu-migrations,minor-faults,major-faults --=
log-fd 1 --=C2=A0
kill 5402 vmstat --timestamp -n 1=C2=A0
wait for background monitors: 5504 5527 5458 5477 5434 5445 5426 5489 5451 =
5558 5573 5521 5550 cpuidle sched_debug interrupts softirqs proc-stat memin=
fo proc-vmstat diskstats slabinfo oom-killer nfs-hang turbostat perf-profile
Error:
The /tmp/lkp-root/perf.data file has no samples!

Do I need any additional setup?

I tried to measure the regression using the Apache benchmarking tool
directly with:

ab -t 300 -c 1000 -n 1000000 -q -k http://127.0.0.1/

and, across the named patches I see no relevant differences, and =

(oddly enough) some measurable improvement=C2=A0vs the vanilla linux-net.
Can the measured regression be caused by some fuzz in the test
environment, like the test being run on different HW?

Finally I recently posted a v2 of the relevant series, will that go
through the same tests? Can I please get notified in case the series
pass the test without regressions? (I assume an email similar to the
previous one will be sent in case of failure).

Thank you,

Paolo


--===============6738943632853673915==--

