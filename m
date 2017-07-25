Content-Type: multipart/mixed; boundary="===============7857156104136853643=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/refcount] b631e535c6: WARNING:at_net/netlink/af_netlink.c:#netlink_sock_destruct
Date: Tue, 25 Jul 2017 11:38:30 -0700
Message-ID: <CAGXu5jJb=iqctW_XETSKjpA9zMPkqdmeKqdcWazhAwKZ=ZPkhw@mail.gmail.com>
In-Reply-To: <20170725104345.glktqznaxwlk65gp@ishxps>
List-Id: <oe-lkp.lists.linux.dev>

--===============7857156104136853643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2017 at 3:43 AM, Hans Liljestrand
<liljestrandh@gmail.com> wrote:
> On Mon, Jul 24, 2017 at 08:21:16PM -0700, Kees Cook wrote:
>>
>> On Mon, Jul 24, 2017 at 6:03 AM, Hans Liljestrand
>> <liljestrandh@gmail.com> wrote:
>>>
>>> On Sun, Jul 23, 2017 at 08:52:53PM -0700, Kees Cook wrote:
>>>>
>>>>
>>>> Is 14afee4b6092f ("net: convert sock.sk_wmem_alloc from atomic_t to
>>>> refcount_t") correct? That looks like a statistics counter, not a
>>>> refcounter? I can't quite tell, though...
>>>
>>>
>>>
>>> Hmm, yes, it looks a bit weird, but it is used in a refcount fashion
>>> here:
>>>
>>> void sk_free(struct sock *sk)
>>> {
>>>         /*
>>>          * We subtract one from sk_wmem_alloc and can know if
>>>          * some packets are still in some tx queue.
>>>          * If not null, sock_wfree() will call __sk_free(sk) later
>>>          */
>>>         if (refcount_dec_and_test(&sk->sk_wmem_alloc))
>>>                 __sk_free(sk);
>>> }
>>>
>>> http://elixir.free-electrons.com/linux/v4.13-rc1/source/net/core/sock.c=
#L1605
>>
>>
>> Ah yeah, there it is. Hrmpf. Something is triggering WARNs, though...
>> I wonder if this can get examined more closely?
>
>
> I tried reproducing the error but I don't seem to know how to use lkp. Got
> lots of permission denied errors and finally ran out of disk space (after
> using up ~50GB).
>
> Maybe I did something wrong?
>
> What I did was: Cloned the related kernel repository, checked out offendi=
ng
> commit, plopped in config, compiled bzImage. Then I just cloned the lkp r=
epo
> and tried running the provided command line with the bzImage and provided
> script.
>
> I'll take another look once I have the time, might be I missed something
> earlier.

Yeah, I'm not sure. Seems it was found through trinity? And only after
36 seconds, too.

>> Also, why not atomic->refcount for sk_rmem_alloc?
>
> I couldn't find any similar refcount-like use on sk_rmem_alloc.

Okay, interesting.

> And as noted the sk_wmem_alloc thing is also a bit dubious. It looks like=
 it
> serves a dual purpose of actual allocation size and occasional reference
> counter.

Could you ask net-dev to see what is actually happening here? This
looks like a regression, but also very odd (broken?) refcounting ...

-Kees


-- =

Kees Cook
Pixel Security

--===============7857156104136853643==--

