Content-Type: multipart/mixed; boundary="===============7343213278589745148=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] ipc/shm: properly return EIDRM in shm_lock()
Date: Tue, 25 Sep 2018 10:23:20 -0700
Message-ID: <CAGXu5jKv_FHPOwy9q_3szHBz5XPPfLWCSwYax=cHU1nHze-U5A@mail.gmail.com>
In-Reply-To: <CAK8P3a3TMUbqLtde-wJyvF+H31VTPQwCKCqPjf41dwGMK-vbQg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7343213278589745148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 5:00 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Aug 24, 2018 at 5:09 AM Davidlohr Bueso <dave@stgolabs.net> wro=
te:
>>
>> When getting rid of the general ipc_lock(), this was missed
>> furthermore, making the comment around the ipc object validity
>> check bogus. Under EIDRM conditions, callers will in turn not
>> see the error and continue with the operation.
>>
>> Fixes: 82061c57ce9 (ipc: drop ipc_lock())
>> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
>> ---
>
> Oddly, this change introduces a gcc warning in some configurations
> (i.e. with randstruct enabled):
>
> ipc/shm.c: In function 'shm_lock':
> ipc/shm.c:209:9: note: randstruct: casting between randomized
> structure pointer types (ssa): 'struct shmid_kernel' and 'struct
> kern_ipc_perm'
>   return (void *)ipcp;
>          ^~~~~~~~~~~~
>
> Not sure why we didn't see that warning before, probably
> it ended up making its own thing when the return code
> was uninitialized.

The fix is already queued up in mmotm:

https://www.ozlabs.org/~akpm/mmotm/broken-out/ipc-shm-use-err_cast-for-shm_=
lock-error-return.patch

randstruct stays quiet about ERR_PTR-family casts since they're not
"real" casts to a functional struct.

-Kees

-Kees

-- =

Kees Cook
Pixel Security

--===============7343213278589745148==--

