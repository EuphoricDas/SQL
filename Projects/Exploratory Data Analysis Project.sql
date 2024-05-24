-- Exploratory Data Analysis

select * 
from layoffs_staging2;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

-- percentage laid off=1 essentially means that 100% of the
-- employees were laid off so let's take a look at those comapnies
select *
from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc;

select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select min(`date`), max(`date`)
from layoffs_staging2;

select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

select  year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;

select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;

-- this doesn't give us much info coz we don't know the total sum
select company, sum(percentage_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

-- Now we'll see the progression of the layoffs
select substring(`date`,1,7) as `Month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `Month`
order by 1 asc;

with rolling_total as
(
select substring(`date`,1,7) as `Month`, sum(total_laid_off) as total_laid_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `Month`
order by 1 asc
)
select `Month`, total_laid_off,
 sum(total_laid_off) over(order by `Month`) as rolling_total
from rolling_total;

-- Now let's look at the companies
select company, year(`date`),sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc;


-- Now we'll get the top 5 total laid off companies of each year 
with company_year(company, years, total_laid_off) as
(
select company, year(`date`),sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
), company_year_rank as
(select *, 
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select *
from company_year_rank
where ranking <= 5;