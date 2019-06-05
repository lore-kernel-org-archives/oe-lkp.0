Content-Type: multipart/mixed; boundary="===============3724663821052780542=="
MIME-Version: 1.0
From: Dan Rue <dan.rue@linaro.org>
To: lkp@lists.01.org
Subject: Re: CKI hackfest @Plumbers invite
Date: Wed, 05 Jun 2019 15:46:59 -0500
Message-ID: <20190605204659.npyf7wnmsdlr2bff@xps.therub.org>
In-Reply-To: <1667759567.21267950.1558450452057.JavaMail.zimbra@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3724663821052780542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 10:54:12AM -0400, Veronika Kabatova wrote:
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
> =

> Feel free to contact us if you have any questions,
> Veronika
> CKI Project

Hi Veronika! Thanks for organizing this. I plan to attend, and I'm happy
to help out.

With regard to the agenda, I've been following the '[Ksummit-discuss]
[MAINTAINERS SUMMIT] Squashing bugs!'[1] thread with interest, as it
relates especially to 'Getting results to developers/maintainers'. This,
along with result aggregation, are important areas to focus.

Dan

[1] https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2019-May/00=
6389.html

> =

> =

> -----------------------------------------------------------
> Here is an early agenda we put together:
> - Introductions
> - Common place for upstream results, result publishing in general
>   - The discussion on the mailing list is going strong so we might be abl=
e to
>     substitute this session for a different one in case everything is sol=
ved by
>     September.
> - Test result interpretation and bug detection
>   - How to autodetect infrastructure failures, regressions/new bugs and t=
est
>     bugs? How to handle continuous failures due to known bugs in both tes=
ts and
>     kernel? What's your solution? Can people always trust the results they
>     receive?
> - Getting results to developers/maintainers
>   - Aimed at kernel developers and maintainers, share your feedback and
>     expectations.
>   - How much data should be sent in the initial communication vs. a click=
 away
>     in a dashboard? Do you want incremental emails with new results as th=
ey come
>     in?
>   - What about adding checks to tested patches in Patchwork when patch se=
ries
>     are being tested?
>   - Providing enough data/script to reproduce the failure. What if specia=
l HW
>     is needed?
> - Onboarding new kernel trees to test
>   - Aimed at kernel developers and maintainers.
>   - Which trees are most prone to bring in new problems? Which are the mo=
st
>     critical ones? Do you want them to be tested? Which tests do you feel=
 are
>     most beneficial for specific trees or in general?
> - Security when testing untrusted patches
>   - How do we merge, compile, and test patches that have untrusted code i=
n them
>     and have not yet been reviewed? How do we avoid abuse of systems,
>     information theft, or other damage?
>   - Check out the original patch that sparked the discussion at
>     https://patchwork.ozlabs.org/patch/862123/
> - Avoiding effort duplication
>   - Food for thought by GregKH
>   - X different CI systems running ${TEST} on latest stable kernel on x86=
_64
>     might look useless on the first look but is it? AMD/Intel CPUs, diffe=
rent
>     network cards, different graphic drivers, compilers, kernel configura=
tion...
>     How do we distribute the workload to avoid doing the same thing all o=
ver
>     again while still running in enough different environments to get the=
 most
>     coverage?
> - Common hardware pools
>   - Is this something people are interested in? Would be helpful especial=
ly for
>     HW that's hard to access, eg. ppc64le or s390x systems. Companies cou=
ld also
>     sing up to share their HW for testing to ensure kernel works with the=
ir
>     products.

-- =

Linaro - Kernel Validation

--===============3724663821052780542==--

