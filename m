Content-Type: multipart/mixed; boundary="===============2197936528001589059=="
MIME-Version: 1.0
From: Greg KH <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: CKI hackfest @Plumbers invite
Date: Tue, 21 May 2019 18:47:04 +0200
Message-ID: <20190521164704.GB8787@kroah.com>
In-Reply-To: <1667759567.21267950.1558450452057.JavaMail.zimbra@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2197936528001589059==
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

So I guess I'm going to be there?

Ok, fair enough, I'll be present, looks good :)

thanks,

greg k-h

--===============2197936528001589059==--

