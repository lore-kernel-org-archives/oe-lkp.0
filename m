Content-Type: multipart/mixed; boundary="===============5754516995566310511=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ipv6] 2b760fcf5c: WARNING:suspicious_RCU_usage
Date: Fri, 13 Oct 2017 07:10:19 -0700
Message-ID: <CANn89iLdB6AUUf4qY0tcNrk3vsdm_A_+r1ebMOfbZBWtb=ysMQ@mail.gmail.com>
In-Reply-To: <CAEA6p_DEoZ2nRVtxVB_gQ1KaXtrFyetxworMPmZsgjah+TS16A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5754516995566310511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 10:09 PM, Wei Wang <weiwan@google.com> wrote:
>
> This warning should be fixed by later commit 66f5d6ce53e6 ("ipv6:
> replace rwlock with rcu and spinlock in fib6_table").
> But by this commit, rcu is not yet used in ip6_pol_route(). (Sorry
> that I missed this earlier.) Not sure what to do here to fix this
> particular warning for this commit.

Hi Wei

There is nothing special to be done, if the current tree is all good.

Such a major patch series being done without a single temp 'bug' would
have been quite a challenge.

Thanks !

--===============5754516995566310511==--

