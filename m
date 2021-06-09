Content-Type: multipart/mixed; boundary="===============5162706690336409631=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [irqdomain] 2cb09c90a4: suspend-stress.fail
Date: Wed, 09 Jun 2021 16:37:08 +0800
Message-ID: <20210609083708.GC15555@xsang-OptiPlex-9020>
In-Reply-To: <871r9k1bh7.wl-maz@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============5162706690336409631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hi Marc,

On Wed, Jun 02, 2021 at 05:24:04PM +0100, Marc Zyngier wrote:
> Hi Rui,
> =

> On Wed, 02 Jun 2021 09:25:31 +0100,
> Zhang Rui <rui.zhang@intel.com> wrote:
> > =

> > On Wed, 2021-06-02 at 08:55 +0100, Marc Zyngier wrote:
> > > Hi Oliver,
> > > =

> > > On Wed, 02 Jun 2021 08:12:31 +0100,
> > > kernel test robot <oliver.sang@intel.com> wrote:
> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed the following commit (built with gcc-9):
> > > > =

> > > > commit: 2cb09c90a4cde464dbfe78a57a9c128625c31122 ("irqdomain:
> > > > Introduce irq_resolve_mapping()")
> > > > https://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git
> > > > irq/generic_handle_irq_domain
> =

> [...]
> =

> > >
> > > Can you give a few more details about the failure mode? Did you
> > > expect
> > > the network interface to show up earlier?
> > =

> > TBH, we don't know if this is caused by the network failure or not.
> > It is a remote machine that I need to take some time to verify this.
> > =

> > >  How repeatable is this
> > > issue?
> > =

> > It seems to be intermittent but relatively easy to reproduce.
> > Here is what I did.
> > 1. run 10 suspend iterations after boot
> > 2. reboot and repeat step 1 by 10 times.
> > =

> > The test is done on three different machines, an old Ivybridge laptop,
> > a skylake laptop and a kabylake laptop.
> =

> Let's just say that I very little idea of what these names represent,
> but I do have an *old* laptop around (i7-2760QM), on which I was able
> to reproduce something.
> =

> I have the strong feeling that something in the resume path is tearing
> down a live mapping while the interrupt is being looked up, which
> would be an interesting bug on its own. But it should be pretty cheap
> to work around that. Could you try the hack below on top of the
> offending commit? It did fix the resume issue for me:
> =


we tested below patch on platform where we made out original report,
confirmed the failure was fixed.

we will try to test on other platforms and if there are any problem,
we will let you know. Thanks

> <quote>
> maz(a)hina:~$ sudo dmesg| grep "ACPI: Low-level resume complete"| wc -l
> 20
> </quote>
> =

> Thanks,
> =

> 	M.
> =

> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 189f559fb26c..5b7de0647ea7 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -402,8 +402,15 @@ static inline unsigned int irq_create_mapping(struct=
 irq_domain *host,
>  	return irq_create_mapping_affinity(host, hwirq, NULL);
>  }
>  =

> -extern struct irq_desc *irq_resolve_mapping(struct irq_domain *domain,
> -					    irq_hw_number_t hwirq);
> +extern struct irq_desc *__irq_resolve_mapping(struct irq_domain *domain,
> +					      irq_hw_number_t hwirq,
> +					      unsigned int *irq);
> +
> +static inline struct irq_desc *irq_resolve_mapping(struct irq_domain *do=
main,
> +						   irq_hw_number_t hwirq)
> +{
> +	return __irq_resolve_mapping(domain, hwirq, NULL);
> +}
>  =

>  /**
>   * irq_find_mapping() - Find a linux irq from a hw irq number.
> @@ -413,12 +420,12 @@ extern struct irq_desc *irq_resolve_mapping(struct =
irq_domain *domain,
>  static inline unsigned int irq_find_mapping(struct irq_domain *domain,
>  					    irq_hw_number_t hwirq)
>  {
> -	struct irq_desc *desc =3D irq_resolve_mapping(domain, hwirq);
> +	unsigned int irq;
>  =

> -	if (unlikely(!desc))
> -		return 0;
> +	if (__irq_resolve_mapping(domain, hwirq, &irq))
> +		return irq;
>  =

> -	return irq_desc_get_irq(desc);
> +	return 0;
>  }
>  =

>  static inline unsigned int irq_linear_revmap(struct irq_domain *domain,
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 13a3021e9370..012d6bf456aa 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -879,11 +879,13 @@ EXPORT_SYMBOL_GPL(irq_dispose_mapping);
>   * irq_resolve_mapping() - Find a linux irq from a hw irq number.
>   * @domain: domain owning this hardware interrupt
>   * @hwirq: hardware irq number in that domain space
> + * @irq: optional pointer to return the Linux irq if required
>   *
>   * Returns the interrupt descriptor.
>   */
> -struct irq_desc *irq_resolve_mapping(struct irq_domain *domain,
> -				     irq_hw_number_t hwirq)
> +struct irq_desc *__irq_resolve_mapping(struct irq_domain *domain,
> +				       irq_hw_number_t hwirq,
> +				       unsigned int *irq)
>  {
>  	struct irq_desc *desc =3D NULL;
>  	struct irq_data *data;
> @@ -911,12 +913,16 @@ struct irq_desc *irq_resolve_mapping(struct irq_dom=
ain *domain,
>  	else
>  		data =3D radix_tree_lookup(&domain->revmap_tree, hwirq);
>  =

> -	if (likely(data))
> +	if (likely(data)) {
>  		desc =3D irq_data_to_desc(data);
> +		if (irq)
> +			*irq =3D data->irq;
> +	}
> +
>  	rcu_read_unlock();
>  	return desc;
>  }
> -EXPORT_SYMBOL_GPL(irq_resolve_mapping);
> +EXPORT_SYMBOL_GPL(__irq_resolve_mapping);
>  =

>  /**
>   * irq_domain_xlate_onecell() - Generic xlate for direct one cell bindin=
gs
> =

> -- =

> Without deviation from the norm, progress is not possible.
--===============5162706690336409631==--

