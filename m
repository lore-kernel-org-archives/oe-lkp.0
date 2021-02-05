Content-Type: multipart/mixed; boundary="===============1247176397881780716=="
MIME-Version: 1.0
From: Petr Mladek <pmladek@suse.com>
To: lkp@lists.01.org
Subject: Re: [printk] b031a684bf: INFO:rcu_tasks_detected_stalls_on_tasks
Date: Fri, 05 Feb 2021 10:32:31 +0100
Message-ID: <YB0Qr1XDBCUghEja@alley>
In-Reply-To: <878s83h63x.fsf@jogness.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1247176397881780716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 2021-02-04 22:38:02, John Ogness wrote:
> On 2021-01-22, kernel test robot <oliver.sang@intel.com> wrote:
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: b031a684bfd01d633c79d281bd0cf11c2f834ada ("printk: remove logbu=
f_lock writer-protection of ringbuffer")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> So I finally tracked down the problem. And yes, it is a problem with the
> ringbuffer. And it turns out this is the same problem reported here [0].

Uff. Great work!

> If message sizes average larger than expected (more than 32 characters),
> the data_ring will wrap before the desc_ring. Once the data_ring wraps,
> it will start invalidating descriptors. These invalid descriptors hang
> around until they are eventually recycled (when the desc_ring
> wraps). Readers do not care about invalid descriptors, but they still
> have to iterate past them. If the average message size is much larger
> than 32 characters, then there will be many invalid descriptors
> preceeding the valid descriptors.
> =

> For this particular LKP report, the RCU stalls started happening as the
> number of invalid descriptors approached 17000. The reason this causes a
> problem is because of the function prb_first_valid_seq(). It starts at
> the oldest descriptor and searches to find the oldest _valid_
> descriptor. In this case, it had to iterate past 17000 descriptors every
> time.

Sigh. Good to know that iterating over these many descriptors has
such a cost.

> prb_first_valid_seq() is used in devkmsg_read() and in
> devkmsg_poll(). And worse, it is called with local interrupts disabled
> and logbuf_lock locked.
> =

> The solution is to avoid using prb_first_valid_seq() if possible. And
> indeed, in both of these cases it is a simple change:
> =

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index c8847ee571f0..76e8df20fdf9 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -736,9 +736,9 @@ static ssize_t devkmsg_read(struct file *file, char _=
_user *buf,
>  		logbuf_lock_irq();
>  	}
>  =

> -	if (user->seq < prb_first_valid_seq(prb)) {
> +	if (r->info->seq !=3D user->seq) {

NOTE: This made me to realize one thing. We return -EPIPE even when
      prb_reserve() was able to reserve the desriptor but not the data
      space. It means that the message was lost already when it was
      being stored.

      It makes sense. It seems that we handle correctly even the situation
      when empty line is stored. But it is something less obvious.
      And we should keep it in mind.


>  		/* our last seen message is gone, return error and reset */
> -		user->seq =3D prb_first_valid_seq(prb);
> +		user->seq =3D r->info->seq;
>  		ret =3D -EPIPE;
>  		logbuf_unlock_irq();
>  		goto out;
> @@ -813,6 +813,7 @@ static loff_t devkmsg_llseek(struct file *file, loff_=
t offset, int whence)
>  static __poll_t devkmsg_poll(struct file *file, poll_table *wait)
>  {
>  	struct devkmsg_user *user =3D file->private_data;
> +	struct printk_info info;
>  	__poll_t ret =3D 0;
>  =

>  	if (!user)
> @@ -821,9 +822,9 @@ static __poll_t devkmsg_poll(struct file *file, poll_=
table *wait)
>  	poll_wait(file, &log_wait, wait);
>  =

>  	logbuf_lock_irq();
> -	if (prb_read_valid(prb, user->seq, NULL)) {
> +	if (prb_read_valid_info(prb, user->seq, &info, NULL)) {
>  		/* return error when data has vanished underneath us */
> -		if (user->seq < prb_first_valid_seq(prb))
> +		if (info.seq !=3D user->seq)
>  			ret =3D EPOLLIN|EPOLLRDNORM|EPOLLERR|EPOLLPRI;
>  		else
>  			ret =3D EPOLLIN|EPOLLRDNORM;
> =


The change looks good to me. Please, send it as a proper patch.

> Once logbuf_lock and safe buffer usage is removed, this efficiency
> wouldn't matter to the kernel anyway. But I am glad we hit it while it
> still mattered because we should not be carelessly wasting CPU cycles
> for any task.

+1

> Interestingly enough, LTP reported a problem with this code back in July
> 2020. The "invalid descriptor issue" was clearly stated [1] and Petr
> even made a suggestion [2] which is nearly identical to how I propose to
> fix it here.
> =

> prb_first_valid_seq() is used unnecessarily in some syslog and devkmsg
> locations as well. And prb_first_valid_seq() itself can also be slightly
> improved.

I am curious what idea you have ;-) I wonder if it might help to cache
that last known first_valid_seq, e.g. in struct prb_desc_ring.

But it might be tricky because it must be lockless and it is a 64-bit
value. It might be solved by some lazy approach, e.g. trylock.
But there is still the question who should pay the prize for this.
IMHO, it should be on the reader side.

> I am preparing a patch against linux-next for this. And although the
> current situation is not pretty, I do not think it needs to be rushed
> for 5.11. It is an inefficiency that occurs if the average message size
> greatly exceeds 32 bytes and the ringbuffer is being blasted by new
> messages and userspace is reading the ringbuffer.

I agree. 5.11 release is getting close. And it might go in via stable
quite quickly.

Best Regards,
Petr
--===============1247176397881780716==--

