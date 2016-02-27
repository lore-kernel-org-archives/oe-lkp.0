Content-Type: multipart/mixed; boundary="===============0935886257048134209=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/fpu] 58122bf1d8: WARNING: CPU: 0 PID: 1 at arch/x86/include/asm/fpu/internal.h:529 fpu__restore+0x28f/0x9ab()
Date: Sat, 27 Feb 2016 14:13:37 +0100
Message-ID: <20160227131337.GB5261@pd.tnic>
In-Reply-To: <20160227120211.GA25164@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0935886257048134209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 27, 2016 at 01:02:11PM +0100, Ingo Molnar wrote:
> So I'm wondering, why did this commit:
> =

>   58122bf1d856 x86/fpu: Default eagerfpu=3Don on all CPUs
> =


Hmm, so looking at switch_fpu_prepare():

        /*
         * If the task has used the math, pre-load the FPU on xsave process=
ors
         * or if the past 5 consecutive context-switches used math.
         */
        fpu.preload =3D static_cpu_has(X86_FEATURE_FPU) &&
                      new_fpu->fpstate_active &&
                      (use_eager_fpu() || new_fpu->counter > 5);
		       ^^^^^^^^^^^^^^

and later:

        if (old_fpu->fpregs_active) {

		...

                /* Don't change CR0.TS if we just switch! */
                if (fpu.preload) {
			...
                        __fpregs_activate(new_fpu);


so I can see a possible link between 58122bf1d856 and what we're seeing.

But as I've told you offlist, I couldn't confirm that this commit was
the culprit due to my simulated reproducer. So I'm thinking the 0day
guys have a more reliable one.

> trigger the warning, while it never triggered on CPUs that were already =

> eagerfpu=3Don for years?

That I can't explain... yet.

FWIW, the one time splat I saw, happened on an IVB machine on 32-bit
which has always been eagerfpu=3Don.

> There must be something we are still missing I think.

Yeah.

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

--===============0935886257048134209==--

