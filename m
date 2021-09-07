Content-Type: multipart/mixed; boundary="===============8918202161679925156=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 07:14:45 -1000
Message-ID: <YTeeBf64yUwj01Sf@slm.duckdns.org>
In-Reply-To: <YTedOVCV3s6Z210f@carbon.dhcp.thefacebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8918202161679925156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Sep 07, 2021 at 10:11:21AM -0700, Roman Gushchin wrote:
> There are two polar cases:
> 1) a big number of relatively short-living allocations, which lifetime is=
 well
>    bounded (e.g. by a lifetime of a task),
> 2) a relatively small number of long-living allocations, which lifetime
>    is potentially indefinite (e.g. struct mount).
> =

> We can't use the same approach for both cases, otherwise we'll run into e=
ither
> performance or garbage collection problems (which also lead to performance
> problems, but delayed).

Wouldn't a front cache which expires after some seconds catch both cases?

Thanks.

-- =

tejun
--===============8918202161679925156==--

