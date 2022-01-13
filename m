Content-Type: multipart/mixed; boundary="===============7956845131173898009=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [ucounts] 59ec71575a: will-it-scale.per_process_ops -10.3% regression
Date: Thu, 13 Jan 2022 10:17:04 +0800
Message-ID: <20220113021704.GA18396@xsang-OptiPlex-9020>
In-Reply-To: <874k68pyag.fsf@email.froward.int.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7956845131173898009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Wed, Jan 12, 2022 at 01:08:23PM -0600, Eric W. Biederman wrote:
> kernel test robot <oliver.sang@intel.com> writes:
> =

> > Greeting,
> >
> > FYI, we noticed a -10.3% regression of will-it-scale.per_process_ops du=
e to commit:
> =

> =

> I am having a bit of a challenge reading this report.  Does the -10.3%
> mean that will-it-scale.per_process_ops is performing 70873 operations
> per second instead of 78995 aka -10.3% fewer operations per second?

yes

> =

> The per-profile.self-cycles-pp.do_dec_rlimits_put_ucounts now takes +2.6
> more cycles, and perf-profile.self.cycles.pp.inc_rlimit_get_ucounts now
> takes +3.8 more cycles.
> =

> Which if I read this correctly is a regression report about two
> functions taking 3 or 4 cycles more after the code was rearranged inside
> of them.
> =

> Is that correct?  Is this a regression report saying those two functions
> are taking a few cycles more which leads to
> will-it-scale.per_process_ops not being able to perform as many
> operations per second?

yes

> =

> Given the change in the commit mentioned I think this is all down to a
> bug fix causing the code to be rearranged and a compiler optimizations.
> =

> I don't see much room to do anything about this.

got it. this is a bug fix. Thanks for explanation!

> =

> Eric
>=20
--===============7956845131173898009==--

