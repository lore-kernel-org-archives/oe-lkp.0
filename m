Content-Type: multipart/mixed; boundary="===============4767558684978632475=="
MIME-Version: 1.0
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: lkp@lists.01.org
Subject: Re: CKI hackfest @Plumbers invite
Date: Thu, 06 Jun 2019 08:30:35 +0200
Message-ID: <1e8552db-8e7e-100a-2b2d-e2d41cd0c9be@collabora.com>
In-Reply-To: <1667759567.21267950.1558450452057.JavaMail.zimbra@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4767558684978632475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/21/19 4:54 PM, Veronika Kabatova wrote:
> Hi,
> =

> as some of you have heard, CKI Project is planning hackfest CI meetings a=
fter
> Plumbers conference this year (Sept. 12-13). We would like to invite ever=
yone
> who has interest in CI for kernel to come and join us.
> =

> The early agenda with summary is at the end of the email. If you think th=
ere's
> something important missing let us know! Also let us know in case you'd w=
ant to
> lead any of the sessions, we'd be happy to delegate out some work :)
> =

> =

> Please send us an email as soon as you decide to come and feel free to in=
vite
> other people who should be present. We are not planning to cap the attend=
ance
> right now but need to solve the logistics based on the interest. The even=
t is
> free to attend, no additional registration except letting us know is need=
ed.

Hi Veronika, I would like to be there.

Cheers,

Tomeu

> Feel free to contact us if you have any questions,
> Veronika
> CKI Project
> =

> =

> -----------------------------------------------------------
> Here is an early agenda we put together:
> - Introductions
> - Common place for upstream results, result publishing in general
>    - The discussion on the mailing list is going strong so we might be ab=
le to
>      substitute this session for a different one in case everything is so=
lved by
>      September.
> - Test result interpretation and bug detection
>    - How to autodetect infrastructure failures, regressions/new bugs and =
test
>      bugs? How to handle continuous failures due to known bugs in both te=
sts and
>      kernel? What's your solution? Can people always trust the results th=
ey
>      receive?
> - Getting results to developers/maintainers
>    - Aimed at kernel developers and maintainers, share your feedback and
>      expectations.
>    - How much data should be sent in the initial communication vs. a clic=
k away
>      in a dashboard? Do you want incremental emails with new results as t=
hey come
>      in?
>    - What about adding checks to tested patches in Patchwork when patch s=
eries
>      are being tested?
>    - Providing enough data/script to reproduce the failure. What if speci=
al HW
>      is needed?
> - Onboarding new kernel trees to test
>    - Aimed at kernel developers and maintainers.
>    - Which trees are most prone to bring in new problems? Which are the m=
ost
>      critical ones? Do you want them to be tested? Which tests do you fee=
l are
>      most beneficial for specific trees or in general?
> - Security when testing untrusted patches
>    - How do we merge, compile, and test patches that have untrusted code =
in them
>      and have not yet been reviewed? How do we avoid abuse of systems,
>      information theft, or other damage?
>    - Check out the original patch that sparked the discussion at
>      https://patchwork.ozlabs.org/patch/862123/
> - Avoiding effort duplication
>    - Food for thought by GregKH
>    - X different CI systems running ${TEST} on latest stable kernel on x8=
6_64
>      might look useless on the first look but is it? AMD/Intel CPUs, diff=
erent
>      network cards, different graphic drivers, compilers, kernel configur=
ation...
>      How do we distribute the workload to avoid doing the same thing all =
over
>      again while still running in enough different environments to get th=
e most
>      coverage?
> - Common hardware pools
>    - Is this something people are interested in? Would be helpful especia=
lly for
>      HW that's hard to access, eg. ppc64le or s390x systems. Companies co=
uld also
>      sing up to share their HW for testing to ensure kernel works with th=
eir
>      products.
> =

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> =

> View/Reply Online (#404): https://groups.io/g/kernelci/message/404
> Mute This Topic: https://groups.io/mt/31697554/925689
> Group Owner: kernelci+owner(a)groups.io
> Unsubscribe: https://groups.io/g/kernelci/unsub  [tomeu.vizoso(a)collabor=
a.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--===============4767558684978632475==--

