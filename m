Content-Type: multipart/mixed; boundary="===============0621761271122233259=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 07:20:58 -1000
Message-ID: <YTefelthK5kSIvUU@slm.duckdns.org>
In-Reply-To: <22a0156e-f74f-51c8-b7fd-9b5a375d7c81@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============0621761271122233259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 11:18:21AM -0600, Jens Axboe wrote:
> A purely time based approach might be problematic, as you can allocate a
> LOT of data in a short amount of time. Heuristics probably need to be a
> hybrid of "time much time has passed" OR "we're over the front cache
> threshold in terms of deferred accounting". But yes, I don't see why
> we'd necessarily need different approaches for short vs long life times.

Yeah, it'd need some heuristics to guard against the cache exploding and a
lot of laziness in expiration logic but none of those should be too
complicated.

Thanks.

-- =

tejun
--===============0621761271122233259==--

