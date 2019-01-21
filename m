Content-Type: multipart/mixed; boundary="===============0038336454068939188=="
MIME-Version: 1.0
From: Alexey Dobriyan <adobriyan@gmail.com>
To: lkp@lists.01.org
Subject: Re: [/proc/stat] 3047027b34: reaim.jobs_per_min -4.8% regression
Date: Tue, 22 Jan 2019 00:25:15 +0300
Message-ID: <20190121212515.GA18118@avx2>
In-Reply-To: <CAGXu5j+aEs3bq5Ym+VCYGmPQNJZC44vFk9MJDxH1zq=hZ3N4CA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0038336454068939188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2019 at 09:02:53AM +1300, Kees Cook wrote:
> On Fri, Jan 18, 2019 at 9:44 PM kernel test robot <rong.a.chen@intel.co=
m> wrote:
> >
> > Greeting,
> >
> > FYI, we noticed a -4.8% regression of reaim.jobs_per_min due to commit:
> >
> >
> > commit: 3047027b34b8c6404b509903058b89836093acc7 ("[PATCH 2/2] /proc/st=
at: Add sysctl parameter to control irq counts latency")
> > url: https://github.com/0day-ci/linux/commits/Waiman-Long/proc-stat-Red=
uce-irqs-counting-performance-overhead/20190108-104818
> =

> Is this expected? (And it seems like other things in the report below
> are faster? I don't understand why this particular regression was
> called out?)

No, but the sysctl has been dropped, so the point is moot.

--===============0038336454068939188==--

