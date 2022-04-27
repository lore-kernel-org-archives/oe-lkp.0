Content-Type: multipart/mixed; boundary="===============0585250716029653637=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [memcg] a8c49af3be: hackbench.throughput -13.7% regression
Date: Tue, 26 Apr 2022 22:08:36 -0700
Message-ID: <CALvZod4CZt6oSdyC1xZzWOj2nDCdhk0Qn6Ux1UjNmH9Oe7ukrg@mail.gmail.com>
In-Reply-To: <CAJD7tkaDWtgy3Ckhgo+vcbM7oYA8saPCVRvXLDKYHvRGYkKvoQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0585250716029653637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 9:34 PM Yosry Ahmed <yosryahmed@google.com> wrote:
>
[...]
>
> The only seemingly expensive operation in the mod_memcg_state() path
> is the call to cgroup_rstat_updated() (through memcg_rstat_updated()).
> One idea off the top of my head is to batch calls to
> cgroup_rstat_updated(), similar to what 11192d9c124d ("memcg: flush
> stats only if updated") did on the flush side. I am interested to see
> what memcg maintainers think about this problem (and the proposed
> solution).
>

I am suspecting this is some code alignment changes which is causing
this difference. Let's first confirm the issue before thinking about
the optimizations.
--===============0585250716029653637==--

