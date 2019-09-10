Content-Type: multipart/mixed; boundary="===============6625616050610895331=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, memcg] 1e577f970f: will-it-scale.per_process_ops -7.2% regression
Date: Tue, 10 Sep 2019 09:31:20 +0200
Message-ID: <20190910073120.GK2063@dhcp22.suse.cz>
In-Reply-To: <87d0g8hbly.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6625616050610895331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 10-09-19 15:08:41, Huang, Ying wrote:
> Michal Hocko <mhocko@kernel.org> writes:
> =

> > On Mon 09-09-19 10:15:44, kernel test robot wrote:
> >> Greeting,
> >> =

> >> FYI, we noticed a -7.2% regression of will-it-scale.per_process_ops du=
e to commit:
> >
> > What is the memcg setup for this test?
> =

> Except enabling memcg in kernel config, we don't do any special
> setup for memcg for the test.

OK, this is really interesting because the local events introduced by
this commits do not apply to the root memcg. So this smells like another
case when a microbenchmark is sensitive on the memcg layout changes.
-- =

Michal Hocko
SUSE Labs

--===============6625616050610895331==--

