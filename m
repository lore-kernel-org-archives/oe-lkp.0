Content-Type: multipart/mixed; boundary="===============5333831020564009950=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Mon, 27 Jun 2022 16:56:47 +0200
Message-ID: <CANn89i+gKtKsNT3SUJyOc8FiF4EO74Fando7GudeXw0+CPr=EQ@mail.gmail.com>
In-Reply-To: <CALvZod7i_=7bNZR-LAXBPXJFxj-1KBuYs+rmG0iABAE1T90BPg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5333831020564009950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2022 at 4:53 PM Shakeel Butt <shakeelb@google.com> wrote:

> Am I understanding correctly that this 69.4% (or 73.7%) regression is
> with cgroup v2?
>
> Eric did the experiments on v2 but on real hardware where the
> performance impact was negligible.
>
> BTW do you see similar regression for tcp as well or just sctp?

TCP_RR with big packets can show a regression as well.

I gave this perf profile:

    28.69%  [kernel]       [k] copy_user_enhanced_fast_string
    16.13%  [kernel]       [k] intel_idle_irq
     6.46%  [kernel]       [k] page_counter_try_charge
     6.20%  [kernel]       [k] __sk_mem_reduce_allocated
     5.68%  [kernel]       [k] try_charge_memcg
     5.16%  [kernel]       [k] page_counter_cancel

And this points to false sharing on (struct page_counter *)->usage

I guess memcg had free lunch, because of per-socket cache, that we
need to remove.
--===============5333831020564009950==--

